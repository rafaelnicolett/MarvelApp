//
//  SearchCharacterTableViewController.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchCharactersViewController: CharacterTableViewController {
    
    private let disposeBag = DisposeBag()
    
    private lazy var searchController: UISearchController = {
        let s = UISearchController(searchResultsController: nil)
        
        s.searchBar.barTintColor = Appearance.searchBarTintColor
        
        s.dimsBackgroundDuringPresentation = false
        
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("Characters", comment: "Characters - title of characters search view controller")
        
        definesPresentationContext = true
        
        tableView.tableHeaderView = searchController.searchBar
        
        let searchObservable = searchController.searchBar.rx.text.debounce(0.3, scheduler: MainScheduler.instance).flatMap { (text: String?) -> Observable<[Character]> in
            if let query = text, query.characters.count > 2 {
                return self.provider.searchCharacters(with: query)
            } else {
                return Observable<[Character]>.just([])
            }
        }
        
        searchObservable.observeOn(MainScheduler.instance).subscribe { event in
            switch event {
            case .next(let characters):
                self.characterViewModels = characters.map({ CharacterViewModel(character: $0, dataProvider: self.provider) })
            default: break
            }
        }.addDisposableTo(self.disposeBag)
    }
}

