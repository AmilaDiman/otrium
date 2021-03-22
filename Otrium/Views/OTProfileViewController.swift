//
//  OTProfileViewController.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTProfileViewController: OTUIViewController {
    
    private let profilePresenter = OTProfilePresenter(profileDataSource: OTProfileDataSource(),
                                                      repositoryDataSource: OTRepositoryDataSource())
    
    lazy var scrollView : OTUIScrollView = {
        let scrollView = OTUIScrollView()
//        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var profileImageView : OTUIImageView = {
        let imageView = OTUIImageView()
        imageView.layer.cornerRadius = 44
        imageView.clipsToBounds = true
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    lazy var nameLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "Source Sans Pro", size: 16)
        label.text = "Amila Dimantha"
        return label
    }()
    
    lazy var usernameLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "Source Sans Pro", size: 16)
        label.text = "username"

        return label
    }()
    
    lazy var emailLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "Source Sans Pro", size: 16)
        label.text = "amila@gmai.com"

        return label
    }()
    
    lazy var followersLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "Source Sans Pro", size: 16)
        label.text = "22 followers"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var followingLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "Source Sans Pro", size: 16)
        label.text = "22 following"
        label.numberOfLines = 0

        return label
    }()
    
    lazy var pinnedRepoCollectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var topRepoCollectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var starredRepoCollectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .red
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        addSubviewForContraints(view: scrollView)
        
        scrollView.addSubviewForContraints(view: profileImageView)
        scrollView.addSubviewForContraints(view: nameLabel)
        scrollView.addSubviewForContraints(view: usernameLabel)
        scrollView.addSubviewForContraints(view: emailLabel)
        scrollView.addSubviewForContraints(view: followersLabel)
        scrollView.addSubviewForContraints(view: followingLabel)
        scrollView.addSubviewForContraints(view: pinnedRepoCollectionView)
        scrollView.addSubviewForContraints(view: topRepoCollectionView)
        scrollView.addSubviewForContraints(view: starredRepoCollectionView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),

            profileImageView.heightAnchor.constraint(equalToConstant: 88),
            profileImageView.widthAnchor.constraint(equalToConstant: 88),
            profileImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            profileImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 80),

            nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 92),
            nameLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            usernameLabel.heightAnchor.constraint(equalToConstant: 24),
            
            emailLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 25),
            emailLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            emailLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            emailLabel.heightAnchor.constraint(equalToConstant: 24),
            
            followersLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 232),
            followersLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            followersLabel.heightAnchor.constraint(equalToConstant: 24),
            followersLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 110),

            followingLabel.centerYAnchor.constraint(equalTo: followersLabel.centerYAnchor),
            followingLabel.leadingAnchor.constraint(equalTo: followersLabel.trailingAnchor, constant: 10),
            followingLabel.heightAnchor.constraint(equalToConstant: 24),
            followingLabel.widthAnchor.constraint(equalTo: followersLabel.widthAnchor, multiplier: 1),
            
            pinnedRepoCollectionView.topAnchor.constraint(equalTo: followersLabel.bottomAnchor),
            pinnedRepoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pinnedRepoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pinnedRepoCollectionView.heightAnchor.constraint(equalToConstant: 1200),
            pinnedRepoCollectionView.bottomAnchor.constraint(equalTo: topRepoCollectionView.topAnchor),
            
            topRepoCollectionView.topAnchor.constraint(equalTo: pinnedRepoCollectionView.bottomAnchor),
            topRepoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topRepoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topRepoCollectionView.heightAnchor.constraint(equalToConstant: 400),
            topRepoCollectionView.bottomAnchor.constraint(equalTo: starredRepoCollectionView.topAnchor),
            
            starredRepoCollectionView.topAnchor.constraint(equalTo: topRepoCollectionView.bottomAnchor),
            starredRepoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            starredRepoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            starredRepoCollectionView.heightAnchor.constraint(equalToConstant: 400),
            starredRepoCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

        ])
        
        followersLabel.sizeToFit()
    }
    
}
