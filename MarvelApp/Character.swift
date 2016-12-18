//
//  Character.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation

struct Character {
    let id: String
    let name: String
    let description: String?
    let pathImage: String?
    var isFavorite: Bool
}

extension Character : Equatable { }

func == (lhs: Character, rhs: Character) -> Bool {
    return lhs.id == rhs.id
        && lhs.name == rhs.name
        && lhs.description == rhs.description
        && lhs.pathImage == rhs.pathImage
        && lhs.isFavorite == rhs.isFavorite
}
