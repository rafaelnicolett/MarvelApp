//
//  StorageController.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

final class StorageController: Storage {
    
    private let configuration: Realm.Configuration
    
    private let queue = DispatchQueue(label: "Storage", qos: .background)
    
    func realm() -> Realm {
        return try! Realm(configuration: self.configuration)
    }
    
    init(configuration: Realm.Configuration = Realm.Configuration()) {
        self.configuration = configuration
    }
    
    func store(characters: [Character], completion: ((StorageError?) -> ())?) {
        queue.async {
            let realmCharacters = characters.map(RealmCharacter.init)
            do {
                try self.insertOrUpdate(objects: realmCharacters) { oldCharacter, newCharacter in
                    return oldCharacter.name == nil && newCharacter.name != nil
                }
                
                completion?(nil)
            } catch {
                completion?(.exception(error))
            }
        }
    }
    
    func searchCharacters(with query: String) -> Observable<[Character]> {
        let characters = self.realm().objects(RealmCharacter.self).filter("name CONTAINS[c] '\(query)'")
        
        return Observable.from(characters).map { realmCharacters in
            return realmCharacters.map({ $0.character })
        }
    }
    
    func character(withId id: String) -> Observable<Character>{
        let characters = self.realm().objects(RealmCharacter.self).filter("id == '\(id)'")
        
        return Observable.from(characters).map({ $0.character }).takeLast(1)
    }
    
    func updateCharacterFavorite(character: Character) {
        let realmCharacter = RealmCharacter(character: character)
        do {
            try self.insertOrUpdate(object: realmCharacter) { oldCharacter, newCharacter in
                return newCharacter.name != nil
            }
        } catch {

        }
    }
    
    private func fetchOrCreate<T: Object, K>(type: T.Type, primaryKey: K, create: () -> T) throws -> T {
        let realm = self.realm()
        
        if let object = realm.object(ofType: type, forPrimaryKey: primaryKey) {
            return object
        } else {
            let object = create()
            
            try realm.write {
                realm.add(object)
            }
            
            return object
        }
    }
    
    private func insertOrUpdate<T: Object>(objects: [T], updateDecisionHandler: @escaping (_ oldObject: T, _ newObject: T) -> Bool) throws {
        try objects.forEach({ try self.insertOrUpdate(object: $0, updateDecisionHandler: updateDecisionHandler) })
    }
    
    private func insertOrUpdate<T: Object>(object: T, updateDecisionHandler: @escaping (_ oldObject: T, _ newObject: T) -> Bool) throws {
        let realm = self.realm()
        
        guard let primaryKey = T.primaryKey() else {
            fatalError("insertOrUpdate can't be used for objects without a primary key")
        }
        
        guard let primaryKeyValue = object.value(forKey: primaryKey) else {
            fatalError("insertOrUpdate can't be used for objects without a primary key")
        }
        
        if let existingObject = realm.object(ofType: T.self, forPrimaryKey: primaryKeyValue) {
            if updateDecisionHandler(existingObject, object) {
                try realm.write {
                    realm.add(object, update: true)
                }
            }
        } else {
            try realm.write {
                realm.add(object)
            }
        }
    }
}

