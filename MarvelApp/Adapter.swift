//
//  Adapter.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation

enum AdapterError: Error {
    case notImplemented
    case missingRequiredFields
}

class Adapter<I, O> {
    
    var input: I
    
    required init(input: I) {
        self.input = input
    }
    
    func adapt() -> Result<O, AdapterError> {
        return Result.error(.notImplemented)
    }
    
}

