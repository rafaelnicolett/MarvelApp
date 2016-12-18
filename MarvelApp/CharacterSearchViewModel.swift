//
//  CharacterSearchViewModel.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import IGListDiff

final class CharacterSearchViewModel: NSObject {
    
    let character: Character

    
    init(character: Character) {
        self.character = character
        
        super.init()
    }
    
    override func diffIdentifier() -> NSObjectProtocol {
        return character.id as NSObjectProtocol
    }
    
    override func isEqual(_ object: IGListDiffable?) -> Bool {
        guard let other = object as? CharacterSearchViewModel else { return false }
        
        return other.character == self.character
    }
}

