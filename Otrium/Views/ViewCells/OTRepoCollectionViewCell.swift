//
//  OTRepoCollectionViewCell.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTRepoCollectionViewCell: OTUICollectionViewCell {
    //MARK:- Constants

    static let identifier = "OTRepoCollectionViewCell"
    
    //MARK:- View elements

    lazy var profileImageView : OTUIImageView = {
        let imageView = OTUIImageView()
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    lazy var usernameLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "SourceSansPro-Regular", size: 16)
        return label
    }()
    
    lazy var repoTitleLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "SourceSansPro-SemiBold", size: 16)
        return label
    }()
    
    lazy var repoDescriptionLabel : OTUILabel = {
        let label = OTUILabel()
        label.numberOfLines = 1
        label.font = UIFont.init(name: "SourceSansPro-Regular", size: 16)
        return label
    }()
    
    lazy var starsImageView : OTUIImageView = {
        let imageView = OTUIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "star")
        return imageView
    }()
    
    lazy var starCountLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "SourceSansPro-Light", size: 16)
        return label
    }()
    
    lazy var languageLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "SourceSansPro-Regular", size: 16)
        return label
    }()
    
    lazy var languageColorView : OTUIView = {
        let view = OTUIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = .red
        return view
    }()
    
    //MARK:- Overrides

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        usernameLabel.text = ""
        repoTitleLabel.text = ""
        repoDescriptionLabel.text = ""
        languageLabel.text = ""
        starCountLabel.text = ""
    }
    
    //MARK:- Private methods

    private func setupUI() {
        layer.borderWidth = 1
        layer.borderColor =  UIColor.lightGray.withAlphaComponent(0.5).cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
        addSubviewForConstrainted(view: profileImageView)
        addSubviewForConstrainted(view: usernameLabel)
        addSubviewForConstrainted(view: repoTitleLabel)
        addSubviewForConstrainted(view: repoDescriptionLabel)
        addSubviewForConstrainted(view: starsImageView)
        addSubviewForConstrainted(view: starCountLabel)
        addSubviewForConstrainted(view: languageColorView)
        addSubviewForConstrainted(view: languageLabel)
        
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 32),
            profileImageView.widthAnchor.constraint(equalToConstant: 32),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            usernameLabel.heightAnchor.constraint(equalToConstant: 24),
            
            repoTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            repoTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            repoTitleLabel.heightAnchor.constraint(equalToConstant: 24),
            repoTitleLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 4),

            repoDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            repoDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            repoDescriptionLabel.heightAnchor.constraint(equalToConstant: 24),
            repoDescriptionLabel.topAnchor.constraint(equalTo: repoTitleLabel.bottomAnchor, constant: 4),
            
            starsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            starsImageView.widthAnchor.constraint(equalToConstant: 12),
            starsImageView.heightAnchor.constraint(equalToConstant: 12),
            starsImageView.topAnchor.constraint(equalTo: repoDescriptionLabel.bottomAnchor, constant: 18),
            
            starCountLabel.leadingAnchor.constraint(equalTo: starsImageView.trailingAnchor, constant: 4),
            starCountLabel.trailingAnchor.constraint(equalTo: languageColorView.leadingAnchor, constant: 12),
            starCountLabel.heightAnchor.constraint(equalToConstant: 24),
            starCountLabel.widthAnchor.constraint(equalToConstant: 55),
            starCountLabel.centerYAnchor.constraint(equalTo: starsImageView.centerYAnchor),
            
            languageColorView.widthAnchor.constraint(equalToConstant: 10),
            languageColorView.heightAnchor.constraint(equalToConstant: 10),
            languageColorView.centerYAnchor.constraint(equalTo: starCountLabel.centerYAnchor),
            
            languageLabel.leadingAnchor.constraint(equalTo: languageColorView.trailingAnchor, constant: 5),
            languageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            languageLabel.centerYAnchor.constraint(equalTo: starCountLabel.centerYAnchor),
        ])
    }
    
    //MARK:- Public methods
    
    /// Sets the the elements of the cell with the gievn details
    /// - Parameter repository: the details to fill cell elements
    func setup(repository: OTRepositoryModel) {
        profileImageView.loadImageUsingCache(withUrl: repository.imageUrl)
        usernameLabel.text = repository.username
        repoTitleLabel.text = repository.title
        repoDescriptionLabel.text = repository.repoDescription
        languageLabel.text = repository.language
        starCountLabel.text = String(repository.starCount ?? 0)
    }
}
