//
//  Result.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case error(E)
}

