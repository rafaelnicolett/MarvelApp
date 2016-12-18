//
//  RxRealm.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

public enum RxRealmError: Error {
    case objectDeleted
}

public protocol NotificationEmitter {
    
    associatedtype ElementType
    
    func addNotificationBlock(_ block: @escaping (RealmCollectionChange<Self>) -> ()) -> NotificationToken
    
    func toArray() -> [ElementType]
}

extension List: NotificationEmitter {
    public typealias ElementType = Element
    public func toArray() -> [Element] {
        return Array(self)
    }
}

extension AnyRealmCollection: NotificationEmitter {
    public typealias ElementType = Element
    public func toArray() -> [Element] {
        return Array(self)
    }
}

extension Results: NotificationEmitter {
    public typealias ElementType = Element
    public func toArray() -> [Element] {
        return Array(self)
    }
}

extension LinkingObjects: NotificationEmitter {
    public typealias ElementType = Element
    public func toArray() -> [Element] {
        return Array(self)
    }
}

public struct RealmChangeset {
    public let deleted: [Int]
    
    public let inserted: [Int]
    
    public let updated: [Int]
}

public extension ObservableType where E: NotificationEmitter {
    
    public static func from(_ collection: E, scheduler: ImmediateSchedulerType = CurrentThreadScheduler.instance) -> Observable<E> {
        return Observable.create {observer in
            let token = collection.addNotificationBlock {changeset in
                
                let value: E
                
                switch changeset {
                case .initial(let latestValue):
                    value = latestValue
                    
                case .update(let latestValue, _, _, _):
                    value = latestValue
                    
                case .error(let error):
                    observer.onError(error)
                    return
                }
                
                observer.onNext(value)
            }
            
            return Disposables.create {
                observer.onCompleted()
                token.stop()
            }
        }
    }
    
    public static func arrayFrom(_ collection: E, scheduler: ImmediateSchedulerType = CurrentThreadScheduler.instance) -> Observable<Array<E.ElementType>> {
        return Observable.from(collection, scheduler: scheduler)
            .map { $0.toArray() }
    }
    
    public static func changesetFrom(_ collection: E, scheduler: ImmediateSchedulerType = CurrentThreadScheduler.instance) -> Observable<(E, RealmChangeset?)> {
        return Observable.create {observer in
            let token = collection.addNotificationBlock {changeset in
                
                switch changeset {
                case .initial(let value):
                    observer.onNext((value, nil))
                case .update(let value, let deletes, let inserts, let updates):
                    observer.onNext((value, RealmChangeset(deleted: deletes, inserted: inserts, updated: updates)))
                case .error(let error):
                    observer.onError(error)
                    return
                }
            }
            
            return Disposables.create {
                observer.onCompleted()
                token.stop()
            }
        }
    }
    
    public static func changesetArrayFrom(_ collection: E, scheduler: ImmediateSchedulerType = CurrentThreadScheduler.instance) -> Observable<(Array<E.ElementType>, RealmChangeset?)> {
        return Observable.changesetFrom(collection, scheduler: scheduler)
            .map { ($0.toArray(), $1) }
    }
}

public extension Observable {
    
    public static func from(_ realm: Realm, scheduler: ImmediateSchedulerType = CurrentThreadScheduler.instance) -> Observable<(Realm, Realm.Notification)> {
        
        return Observable<(Realm, Realm.Notification)>.create {observer in
            let token = realm.addNotificationBlock {(notification: Realm.Notification, realm: Realm) in
                observer.onNext((realm, notification))
            }
            
            return Disposables.create {
                observer.onCompleted()
                token.stop()
            }
        }
    }
}

extension Realm: ReactiveCompatible {}

extension Reactive where Base: Realm {
    
    public func add<O: Sequence>(update: Bool = false) -> AnyObserver<O> where O.Iterator.Element: Object {
        return RealmObserver(realm: base) {realm, element in
            try! realm.write {
                realm.add(element, update: update)
            }
            }.asObserver()
    }
    
    public func add<O: Object>(update: Bool = false) -> AnyObserver<O> {
        return RealmObserver(realm: base) {realm, element in
            try! realm.write {
                realm.add(element, update: update)
            }
            }.asObserver()
    }
    
    public func delete<S: Sequence>() -> AnyObserver<S> where S.Iterator.Element: Object {
        return RealmObserver(realm: base, binding: { (realm, elements) in
            try! realm.write {
                realm.delete(elements)
            }
        }).asObserver()
    }
    
    public func delete<O: Object>() -> AnyObserver<O> {
        return RealmObserver(realm: base, binding: { (realm, elements) in
            try! realm.write {
                realm.delete(elements)
            }
        }).asObserver()
    }
}

extension Reactive where Base: Realm {
    
    public static func add<O: Sequence>(
        configuration: Realm.Configuration = Realm.Configuration.defaultConfiguration,
        update: Bool = false) -> AnyObserver<O> where O.Iterator.Element: Object {
        
        return RealmObserver(configuration: configuration) {realm, elements in
            try! realm.write {
                realm.add(elements, update: update)
            }
            }.asObserver()
    }
    
    public static func add<O: Object>(
        configuration: Realm.Configuration = Realm.Configuration.defaultConfiguration,
        update: Bool = false) -> AnyObserver<O> {
        
        return RealmObserver(configuration: configuration) {realm, element in
            try! realm.write {
                realm.add(element, update: update)
            }
            }.asObserver()
    }
    
    public static func delete<S: Sequence>() -> AnyObserver<S>  where S.Iterator.Element: Object {
        return AnyObserver {event in
            
            guard let elements = event.element,
                var generator = elements.makeIterator() as S.Iterator?,
                let first = generator.next(),
                let realm = first.realm else {
                    return
            }
            
            try! realm.write {
                realm.delete(elements)
            }
        }
    }
    
    public static func delete<O: Object>() -> AnyObserver<O> {
        return AnyObserver {event in
            
            guard let element = event.element,
                let realm = element.realm else {
                    return
            }
            
            try! realm.write {
                realm.delete(element)
            }
        }
    }
}

public extension ObservableType where E: Object {
    
    public static func from(_ object: E) -> Observable<E> {
        
        guard let realm = object.realm else {
            return Observable<E>.empty()
        }
        guard let primaryKeyName = type(of: object).primaryKey(),
            let primaryKey = object.value(forKey: primaryKeyName) else {
                fatalError("At present you can't observe objects that don't have primary key.")
        }
        
        return Observable<E>.create {observer in
            let objectQuery = realm.objects(type(of: object))
                .filter("%K == %@", primaryKeyName, primaryKey)
            
            let token = objectQuery.addNotificationBlock {changes in
                switch changes {
                case .initial(let results):
                    if let latestObject = results.first {
                        observer.onNext(latestObject)
                    } else {
                        observer.onError(RxRealmError.objectDeleted)
                    }
                case .update(let results, _, _, _):
                    if let latestObject = results.first {
                        observer.onNext(latestObject)
                    } else {
                        observer.onError(RxRealmError.objectDeleted)
                    }
                case .error(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create {
                token.stop()
            }
        }
    }
}

