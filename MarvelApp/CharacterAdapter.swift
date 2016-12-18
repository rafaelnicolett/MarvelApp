//
//  CharacterAdapter.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation
import SwiftyJSON

private extension Character {
    struct Keys {
        static let id = "id"
        static let name = "name"
        static let description = "description"
        static let thumbnail = "thumbnail"
        static let path = "path"
        static let ext = "extension"
    }
}

final class CharacterAdapter: Adapter<JSON, Character> {
    
    override func adapt() -> Result<Character, AdapterError> {
        let id = input[Character.Keys.id].stringValue
        let name = input[Character.Keys.name].stringValue
        let description = input[Character.Keys.description].stringValue
        var pathImage: String = ""
        
        if let thumb: JSON = input[Character.Keys.thumbnail] {
            let path = thumb[Character.Keys.path].stringValue
            let ext = thumb[Character.Keys.ext].stringValue
            pathImage = "\(path).\(ext)"
        }
        
        let character = Character(
            id: id,
            name: name,
            description: description,
            pathImage: pathImage,
            isFavorite: false
        )
        
        return .success(character)
    }
}
