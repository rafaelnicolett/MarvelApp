//
//  RealmObserver.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

class RealmObserver<E>: ObserverType {
    var realm: Realm?
    var configuration: Realm.Configuration?
    
    let binding: (Realm, E) -> Void
    
    init(realm: Realm, binding: @escaping (Realm, E) -> Void) {
        self.realm = realm
        self.binding = binding
    }
    
    init(configuration: Realm.Configuration, binding: @escaping (Realm, E) -> Void) {
        self.configuration = configuration
        self.binding = binding
    }
    

    func on(_ event: Event<E>) {
        switch event {
        case .next(let element):
            if let configuration = configuration, realm == nil {
                let realm = try! Realm(configuration: configuration)
                binding(realm, element)
                return;
            }
            
            guard let realm = realm else {
                fatalError("No realm in RealmObserver at time of a .Next event")
            }
            
            binding(realm, element)
            
        case .error:
            realm = nil
        case .completed:
            realm = nil
        }
    }
    
    func asObserver() -> AnyObserver<E> {
        return AnyObserver(eventHandler: on)
    }
    
    deinit {
        realm = nil
    }
}

