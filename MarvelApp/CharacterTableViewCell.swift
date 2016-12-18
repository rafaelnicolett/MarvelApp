//
//  CharacterTableViewCell.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import UIKit
import SiestaUI

final class CharacterTableViewCell: UITableViewCell {
    
    var viewModel: CharacterViewModel? = nil {
        didSet {
            guard oldValue?.character != viewModel?.character else { return }
            
            updateUI()
        }
    }
    
    private lazy var nameLabel: UILabel = {
        let l = UILabel(frame: .zero)
        
        l.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightMedium)
        l.textColor = UIColor.darkGray
        
        return l
    }()
    
    private lazy var avatarView: RemoteImageView = {
        let v = RemoteImageView(frame: .zero)
        
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        v.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        let circleMask = CAShapeLayer()
        circleMask.frame = CGRect(x: 0, y: 5, width: 45, height: 45)
        circleMask.path = UIBezierPath(ovalIn: circleMask.frame).cgPath
        circleMask.fillColor = UIColor.white.cgColor
        
        v.layer.mask = circleMask
        
        return v
    }()
    
    private lazy var favoriteView: UIImageView = {
        let v = UIImageView(frame: .zero)
        
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 20).isActive = true
        v.widthAnchor.constraint(equalToConstant: 20).isActive = true
        let image = UIImage(named: "onestar_empty")
        v.image = image
        
        return v
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let v = UIStackView(arrangedSubviews: [self.nameLabel])
        
        v.distribution = .equalSpacing
        v.spacing = 10
        v.alignment = .leading
        v.axis = .vertical
        
        return v
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let v = UIStackView(arrangedSubviews: [self.avatarView, self.favoriteView, self.verticalStackView])
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        v.spacing = 10
        v.alignment = .center
        
        return v
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
        
        contentView.addSubview(horizontalStackView)
        horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        
        viewModel.loadCharacterDetailsIfNeeded()
        
        avatarView.imageURL = viewModel.character.pathImage
        
        nameLabel.text = viewModel.character.name ?? ""
        nameLabel.isHidden = viewModel.character.name == nil
        
        if viewModel.character.isFavorite {
            let image = UIImage(named: "onestar_filled")
            favoriteView.image = image
        } else {
            let image = UIImage(named: "onestar_empty")
            favoriteView.image = image
        }
    }
    
}

