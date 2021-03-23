//
//  OTProfileViewController.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTProfileViewController: OTUIViewController {
    
    private let presenter = OTProfilePresenter(profileDataSource: OTProfileDataSource())
    
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
    
    lazy var horizontalLayout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var verticalLayout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()

        
    lazy var pinnedRepoCollectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: verticalLayout)
        collectionView.register(OTRepoCollectionViewCell.self, forCellWithReuseIdentifier: OTRepoCollectionViewCell.identifier)
        collectionView.backgroundColor = .yellow
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    lazy var topRepoCollectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: horizontalLayout)
        collectionView.register(OTRepoCollectionViewCell.self, forCellWithReuseIdentifier: OTRepoCollectionViewCell.identifier)
        collectionView.backgroundColor = .blue
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    lazy var starredRepoCollectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: horizontalLayout)
        collectionView.register(OTRepoCollectionViewCell.self, forCellWithReuseIdentifier: OTRepoCollectionViewCell.identifier)
        collectionView.backgroundColor = .red
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        presenter.delegate = self
        presenter.getStarredRepoDetails()
        presenter.getPinnedRepoDetails()
        presenter.getTopRepoDetails()

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
    }
}

extension OTProfileViewController: UICollectionViewDelegate {
    // to be implemented
}

extension OTProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == pinnedRepoCollectionView {
            return presenter.pinnedRepositories.count
        } else if collectionView == starredRepoCollectionView {
            return presenter.starredRepositories.count
        } else if collectionView == topRepoCollectionView {
            return presenter.topRepositories.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OTRepoCollectionViewCell.identifier,
                                                      for: indexPath) as! OTRepoCollectionViewCell
        
        return cell
    }
}

extension OTProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 320, height: 164)
    }
}

extension OTProfileViewController: OTProfileViewPresenterDelegate {
    func profileDetailsUpdated(_ presenter: OTProfilePresenter, profile: OTProfileModel) {
        
    }
    
    func starredRepositoriesUpdated(_ presenter: OTProfilePresenter, repositories: [OTRepositoryModel]) {
        starredRepoCollectionView.reloadData()
    }
    
    func topRepositoriesUpdated(_ presenter: OTProfilePresenter, repositories: [OTRepositoryModel]) {
        topRepoCollectionView.reloadData()
    }
    
    func pinnedRepositoriesUpdated(_ presenter: OTProfilePresenter, repositories: [OTRepositoryModel]) {
        pinnedRepoCollectionView.reloadData()
    }
}
