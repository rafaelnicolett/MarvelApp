//
//  Storage.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation
import RxSwift

enum StorageError: Error {
    case notFound(String?)
    case exception(Error)
}

protocol Storage: class {
    
    func store(characters: [Character], completion: ((StorageError?) -> ())?)
    func searchCharacters(with query: String) -> Observable<[Character]>
    func character(withId id: String) -> Observable<Character>
    func updateCharacterFavorite(character: Character)
    
}

