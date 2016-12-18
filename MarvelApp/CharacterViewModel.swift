//
//  CharacterViewModel.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation
import IGListDiff

final class CharacterViewModel: NSObject {
    
    let character: Character
    private weak var dataProvider: DataProvider?
    
    var nameForTitle: String {
        return self.character.name
    }
    
    var descriptionForText: String? {
        return self.character.description
    }
    
    var imagePath: String? {
            return self.character.pathImage
    }
    
    init(character: Character, dataProvider: DataProvider? = nil) {
        self.character = character
        self.dataProvider = dataProvider
        
        super.init()
    }
    
    override func diffIdentifier() -> NSObjectProtocol {
        return character.id as NSObjectProtocol
    }
    
    override func isEqual(_ object: IGListDiffable?) -> Bool {
        guard let other = object as? CharacterViewModel else { return false }
        
        return self.character == other.character
    }
    
    func loadCharacterDetailsIfNeeded() {
        // Disabled because of a crash in RxRealm, line 344. TODO: investigate
        guard self.character.name == nil else { return }
        
        _ = dataProvider?.character(withId: self.character.id)
    }
    
}

