//
//  MarvelApi.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation
import Siesta
import SwiftyJSON

final class MarvelAPI {
    
    private struct Endpoints {
        static let searchCharacters = "/characters"
    }
    
    private let service = Service(baseURL: "https://gateway.marvel.com/v1/public/")
    
    init() {
        service.configure("**") { config in
            //config.useNetworkActivityIndicator()
            
            config.pipeline[.parsing].add(self.jsonParser, contentTypes: ["*/json"])
            
            config.pipeline[.cleanup].add(MarvelErrorHandler())
        }
        
        service.configureTransformer(Endpoints.searchCharacters) {
            try self.failableAdapt(using: SearchCharacterAdapter(input: $0.content as JSON))
        }
    }
    
    func searchCharacters(query: String) -> Resource {
        return service
            .resource("/characters")
            .withParam("apikey", Credentials.apiPublicKey)
            .withParam("hash", Credentials.hash)
            .withParam("ts", Credentials.timeStamp)
            .withParam("nameStartsWith", query)
            .withParam("limit", "100")
    }
    
    private let jsonParser = ResponseContentTransformer { JSON($0.content as AnyObject) }
    
    private struct MarvelErrorHandler: ResponseTransformer {
        
        func process(_ response: Response) -> Response {
            switch response {
            case .success:
                return response
            case .failure(var error):
                error.userMessage = error.jsonDict["message"] as? String ?? error.userMessage
                return .failure(error)
            }
        }
    }
    
    private func failableAdapt<T>(using adapter: Adapter<JSON, T>) throws -> T {
        let result = adapter.adapt()
        switch result {
        case .success(let entity):
            return entity
        case .error(let error):
            throw error
        }
    }
    
}

