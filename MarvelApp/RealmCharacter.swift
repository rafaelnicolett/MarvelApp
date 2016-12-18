//
//  RealmCharacter.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmCharacter: Object {
    
    dynamic var id = ""
    dynamic var name = ""
    dynamic var descriptionCharacter: String?
    dynamic var pathImage: String?
    dynamic var isFavorite: Bool = false
    
    override static func indexedProperties() -> [String] {
        return ["name"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension RealmCharacter{
    
    convenience init(character: Character) {
        self.init()
        
        self.id = character.id
        self.name = character.name
        self.descriptionCharacter = character.description
        self.pathImage = character.pathImage
        self.isFavorite = character.isFavorite
    }
    
    var character: Character {
        return Character(
            id: id,
            name: name,
            description: descriptionCharacter,
            pathImage: pathImage,
            isFavorite: isFavorite
        )
    }
}
