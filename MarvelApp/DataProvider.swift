//
//  DataProvider.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation
import RxSwift

final class DataProvider {
    
    private let client: APIClient
    private let storage: Storage
    
    init(client: APIClient, storage: Storage) {
        self.client = client
        self.storage = storage
    }
    
    var error = Variable<Error?>(nil)
    
    func searchCharacters(with query: String) -> Observable<[Character]> {
        client.searchCharacters(query: query) { [weak self] result in
            switch result {
            case .success(let results):
                self?.storage.store(characters: results.items, completion: nil)
            case .error(let error):
                self?.error.value = error
            }
        }
        
        return storage.searchCharacters(with: query)
    }
    
    func updateFavoriteCharacter(character: Character) {
        self.storage.updateCharacterFavorite(character: character)
    }
    
    func character(withId id: String) -> Observable<Character> {
       //TODO: chamar da API para fazer insercao no Storage
        
        return storage.character(withId: id)
    }
}

