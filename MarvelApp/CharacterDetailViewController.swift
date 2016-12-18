//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import UIKit
import RxSwift
import SiestaUI

class CharacterDetailViewController: UIViewController {
    
    private weak var provider: DataProvider!
    
    var character: Character {
        didSet {
            guard character != oldValue else { return }
            
            update(with: character)
        }
    }
    
    init(provider: DataProvider, character: Character) {
        self.provider = provider
        self.character = character
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.white
        view.isOpaque = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        update(with: character)
    }
    
    private lazy var favoriteView: UIImageView = {
        let v = UIImageView(frame: .zero)
        
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 50).isActive = true
        v.widthAnchor.constraint(equalToConstant: 50).isActive = true
        let image = UIImage(named: "onestar_empty")
        v.image = image
        
        return v
    }()
    
    private lazy var nameLabel: UILabel = {
        let l = UILabel(frame: .zero)
        
        l.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)
        l.textColor = UIColor.darkGray
        
        return l
    }()
    
    
    private lazy var avatarView: RemoteImageView = {
        let v = RemoteImageView(frame: .zero)
        
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 155).isActive = true
        v.widthAnchor.constraint(equalToConstant: 155).isActive = true
        v.layer.cornerRadius = 77
        v.layer.masksToBounds = true
        
        return v
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let l = UILabel(frame: .zero)
        
        l.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular)
        l.textColor = Appearance.lightTextColor
        l.numberOfLines = 0
        
        return l
    }()
    
    private lazy var stackView: UIStackView = {
        let v = UIStackView(arrangedSubviews: [
            self.favoriteView,
            self.nameLabel,
            self.avatarView,
            self.descriptionLabel
            ])
        
        v.axis = .vertical
        v.spacing = 18
        v.alignment = .center
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    private func update(with character: Character) {
        let viewModel = CharacterViewModel(character: character)
        
        title = viewModel.nameForTitle
        
        view.addSubview(stackView)
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        nameLabel.text = viewModel.nameForTitle
        
        avatarView.imageURL = character.pathImage
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(CharacterDetailViewController.tapDetected))
        favoriteView.isUserInteractionEnabled = true
        favoriteView.addGestureRecognizer(singleTap)
    
        setImageIsFavorite(character: character)
        
        if let descrip = character.description {
            descriptionLabel.text = descrip
            descriptionLabel.isHidden = false
        } else {
            descriptionLabel.isHidden = true
        }
    }
    
    //Action
    func tapDetected() {
        character.isFavorite = !character.isFavorite
        provider.updateFavoriteCharacter(character: character)
        setImageIsFavorite(character: character)
    }
    
    func setImageIsFavorite(character: Character) {
        if character.isFavorite {
            let image = UIImage(named: "onestar_filled")
            favoriteView.image = image
        } else {
            let image = UIImage(named: "onestar_empty")
            favoriteView.image = image
        }
    }
}

