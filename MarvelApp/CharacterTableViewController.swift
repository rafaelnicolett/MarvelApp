//
//  CharacterTableViewController.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import UIKit
import RxSwift

protocol CharacterTableViewControllerDelegate: class {
    func charactersTableViewController(_ controller: CharacterTableViewController, didSelect character: Character)
}

class CharacterTableViewController: UITableViewController {
    
    weak var provider: DataProvider!
    private weak var delegate: CharacterTableViewControllerDelegate?
    
    init(provider: DataProvider, delegate: CharacterTableViewControllerDelegate? = nil) {
        self.provider = provider
        self.delegate = delegate
        
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let disposeBag = DisposeBag()
    
    private struct Constants {
        static let cellIdentifier = "cell"
    }
    
    /// Set this to update the table view
    var characterViewModels = [CharacterViewModel]() {
        didSet {
            tableView.reload(oldData: oldValue, newData: characterViewModels)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.rowHeight = 66
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! CharacterTableViewCell
        
        cell.viewModel = characterViewModels[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.charactersTableViewController(self, didSelect: characterViewModels[indexPath.row].character)
    }
    
}

extension CharacterTableViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach { path in
            self.characterViewModels[path.row].loadCharacterDetailsIfNeeded()
        }
    }
}

