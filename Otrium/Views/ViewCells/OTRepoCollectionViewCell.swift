//
//  OTRepoCollectionViewCell.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTRepoCollectionViewCell: OTUICollectionViewCell {
    let reuseIdentifierValue = "OTRepoCollectionViewCell"
    
    lazy var profileImageView : OTUIImageView = {
        let imageView = OTUIImageView()
        imageView.layer.cornerRadius = 44
        imageView.clipsToBounds = true
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    lazy var usernameLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "Source Sans Pro", size: 16)
        label.text = "Amila"
        return label
    }()
    
    lazy var repoTitleLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "Source Sans Pro", size: 16)
        label.text = "Amila"
        return label
    }()
    
    lazy var repoDescriptionLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "Source Sans Pro", size: 16)
        label.text = "Amila"
        return label
    }()
    
    lazy var starsImageView : OTUIImageView = {
        let imageView = OTUIImageView()
        imageView.layer.cornerRadius = 44
        imageView.clipsToBounds = true
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    lazy var starCountLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "Source Sans Pro", size: 16)
        label.text = "Amila"
        return label
    }()
    
    lazy var languageLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "Source Sans Pro", size: 16)
        label.text = "Amila"
        return label
    }()
    
    lazy var languageColorView : OTUIView = {
        let view = OTUIView()
        view.backgroundColor = .red
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    private func setupUI() {
        addSubviewForContraints(view: profileImageView)
        addSubviewForContraints(view: usernameLabel)
        addSubviewForContraints(view: repoTitleLabel)
        addSubviewForContraints(view: repoDescriptionLabel)
        addSubviewForContraints(view: starsImageView)
        addSubviewForContraints(view: starCountLabel)
        addSubviewForContraints(view: languageColorView)
        addSubviewForContraints(view: languageLabel)
        
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 32),
            profileImageView.widthAnchor.constraint(equalToConstant: 32),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 8),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
            usernameLabel.heightAnchor.constraint(equalToConstant: 24),
            
            repoTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            repoTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
            repoTitleLabel.heightAnchor.constraint(equalToConstant: 24),
            repoTitleLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 4),

            repoDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            repoDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
            repoDescriptionLabel.heightAnchor.constraint(equalToConstant: 24),
            repoDescriptionLabel.topAnchor.constraint(equalTo: repoTitleLabel.bottomAnchor, constant: 4)
        ])
    }
    
}
