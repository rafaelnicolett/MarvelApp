//
//  SearchResultsAdapter.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation
import SwiftyJSON

private struct SearchResultsKeys {
    static let count = "total"
    static let data = "data"
    static let items = "results"
}

final class SearchCharacterAdapter: Adapter<JSON, SearchResults<Character>> {
    
    override func adapt() -> Result<SearchResults<Character>, AdapterError> {
        guard let itemData: JSON = input[SearchResultsKeys.data] else {
            return .error(.missingRequiredFields)
        }
        
        guard let itemArray = itemData[SearchResultsKeys.items].array else {
            return .error(.missingRequiredFields)
        }
        
        let count = itemData[SearchResultsKeys.count].intValue
        
        let items: [Character] = itemArray.flatMap { jsonCharacter -> Character? in
            let result = CharacterAdapter(input: jsonCharacter).adapt()
            switch result {
            case .error(_): return nil
            case .success(let character): return character
            }
        }
        
        let searchResults = SearchResults<Character>(count: count, data: itemData, items: items)
        
        return .success(searchResults)
    }
}

