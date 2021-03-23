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
        scrollView.refreshControl = refreshControl
        return scrollView
    }()
    
    lazy var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshDetails), for: .valueChanged)
        return refreshControl
    }()
    
    lazy var profileImageView : OTUIImageView = {
        let imageView = OTUIImageView()
        imageView.layer.cornerRadius = 44
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var profileLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "SourceSansPro-SemiBold", size: 20)
        label.text = "Profile"
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "SourceSansPro-SemiBold", size: 32)
        return label
    }()
    
    lazy var usernameLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "SourceSansPro-Regular", size: 16)
        return label
    }()
    
    lazy var emailLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "SourceSansPro-Regular", size: 16)
        return label
    }()
    
    lazy var followersLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "SourceSansPro-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var followingLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "SourceSansPro-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var pinnedRepoHeaderView : OTSectionHeaderView = {
        let view = OTSectionHeaderView()
        view.titleLabel.text = "Pinned"
        return view
    }()
    
    lazy var topRepoHeaderView : OTSectionHeaderView = {
        let view = OTSectionHeaderView()
        view.titleLabel.text = "Top repositories"
        return view
    }()
    
    lazy var starredRepoHeaderView : OTSectionHeaderView = {
        let view = OTSectionHeaderView()
        view.titleLabel.text = "Starred repositories"
        return view
    }()
    
    lazy var horizontalLayout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        return layout
    }()
    
    lazy var verticalLayout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        return layout
    }()
    
    lazy var pinnedRepoCollectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: verticalLayout)
        collectionView.register(OTRepoCollectionViewCell.self, forCellWithReuseIdentifier: OTRepoCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    lazy var topRepoCollectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: horizontalLayout)
        collectionView.register(OTRepoCollectionViewCell.self, forCellWithReuseIdentifier: OTRepoCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    lazy var starredRepoCollectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: horizontalLayout)
        collectionView.register(OTRepoCollectionViewCell.self, forCellWithReuseIdentifier: OTRepoCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        
        setupUI()
        refreshDetails()
    }
    
    @objc func refreshDetails() {
        refreshControl.beginRefreshing()
        presenter.getStarredRepoDetails()
        presenter.getPinnedRepoDetails()
        presenter.getTopRepoDetails()
        presenter.getProfileDetails()
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        addSubviewForContraints(view: scrollView)
        scrollView.addSubviewForContraints(view: profileLabel)
        scrollView.addSubviewForContraints(view: profileImageView)
        scrollView.addSubviewForContraints(view: nameLabel)
        scrollView.addSubviewForContraints(view: usernameLabel)
        scrollView.addSubviewForContraints(view: emailLabel)
        scrollView.addSubviewForContraints(view: followersLabel)
        scrollView.addSubviewForContraints(view: followingLabel)
        scrollView.addSubviewForContraints(view: pinnedRepoCollectionView)
        scrollView.addSubviewForContraints(view: topRepoCollectionView)
        scrollView.addSubviewForContraints(view: starredRepoCollectionView)
        scrollView.addSubviewForContraints(view: topRepoHeaderView)
        scrollView.addSubviewForContraints(view: pinnedRepoHeaderView)
        scrollView.addSubviewForContraints(view: starredRepoHeaderView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            profileLabel.heightAnchor.constraint(equalToConstant: 24),
            profileLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            profileLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            profileLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            
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
            
            pinnedRepoHeaderView.topAnchor.constraint(equalTo: followersLabel.bottomAnchor, constant: 24),
            pinnedRepoHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pinnedRepoHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pinnedRepoHeaderView.heightAnchor.constraint(equalToConstant: 32),
            
            pinnedRepoCollectionView.topAnchor.constraint(equalTo: pinnedRepoHeaderView.bottomAnchor, constant: 12),
            pinnedRepoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pinnedRepoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pinnedRepoCollectionView.heightAnchor.constraint(equalToConstant: 524),
            pinnedRepoCollectionView.bottomAnchor.constraint(equalTo: topRepoHeaderView.topAnchor, constant: -32),
            
            topRepoHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topRepoHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topRepoHeaderView.heightAnchor.constraint(equalToConstant: 32),
            
            topRepoCollectionView.topAnchor.constraint(equalTo: topRepoHeaderView.bottomAnchor, constant: 12),
            topRepoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topRepoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topRepoCollectionView.heightAnchor.constraint(equalToConstant: 180),
            
            starredRepoHeaderView.topAnchor.constraint(equalTo: topRepoCollectionView.bottomAnchor, constant: 32),
            starredRepoHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            starredRepoHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            starredRepoHeaderView.heightAnchor.constraint(equalToConstant: 32),
            
            starredRepoCollectionView.topAnchor.constraint(equalTo: starredRepoHeaderView.bottomAnchor, constant: 12),
            starredRepoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            starredRepoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            starredRepoCollectionView.heightAnchor.constraint(equalToConstant: 180),
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
        
        if collectionView == pinnedRepoCollectionView {
            cell.setup(repository: presenter.pinnedRepositories[indexPath.row])
        } else if collectionView == starredRepoCollectionView {
            cell.setup(repository: presenter.starredRepositories[indexPath.row])
        } else if collectionView == topRepoCollectionView {
            cell.setup(repository: presenter.topRepositories[indexPath.row])
        }
        
        return cell
    }
}

extension OTProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == starredRepoCollectionView || collectionView == topRepoCollectionView {
            return .init(width: (collectionView.frame.width/2) - 24, height: 164)
        }
        
        return .init(width: collectionView.frame.width - 24, height: 164)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == starredRepoCollectionView || collectionView == topRepoCollectionView {
            return .init(top: 0, left: 16, bottom: 0, right: 16)
        }
        
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension OTProfileViewController: OTProfileViewPresenterDelegate {
    func profileDetailsUpdated(_ presenter: OTProfilePresenter, profile: OTProfileModel) {
        profileImageView.loadImageUsingCache(withUrl: profile.imageUrl)
        
        usernameLabel.text = profile.username
        nameLabel.text = profile.name
        emailLabel.text = profile.email
        followersLabel.text = String("\(profile.followers!) followers")
        followingLabel.text = String("\(profile.following!) following")
        
        refreshControl.endRefreshing()
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
