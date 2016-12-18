//
//  SearchResults.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SearchResults<Model> {
    let count: Int
    let data: JSON
    let items: [Model]
}
