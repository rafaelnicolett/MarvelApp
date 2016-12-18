//
//  UITableView+Diff.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import UIKit
import IGListDiff

extension UITableView {
    
    func reload(oldData: [IGListDiffable], newData: [IGListDiffable]) {
        let diff = IGListDiffPaths(0, 0, oldData, newData, .equality)
        
        beginUpdates()
        insertRows(at: diff.inserts, with: .top)
        deleteRows(at: diff.deletes, with: .bottom)
        reloadRows(at: diff.updates, with: .none)
        endUpdates()
    }
}




