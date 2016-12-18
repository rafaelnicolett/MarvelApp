//
//  APIClient.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation

enum APIError: Error {
    case unknown
    case http(Error)
    case adapter
}

protocol APIClient {
    
    func searchCharacters(query: String, completion: @escaping (Result<SearchResults<Character>, APIError>) -> ())
}

