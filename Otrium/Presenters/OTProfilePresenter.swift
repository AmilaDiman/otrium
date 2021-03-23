//
//  OTProfilePresenter.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

protocol OTProfileViewPresenterDelegate: class {
    func pinnedRepositoriesUpdated(_ presenter: OTProfilePresenter, repositories: [OTRepositoryModel])
    func starredRepositoriesUpdated(_ presenter: OTProfilePresenter, repositories: [OTRepositoryModel])
    func topRepositoriesUpdated(_ presenter: OTProfilePresenter, repositories: [OTRepositoryModel])
    func profileDetailsUpdated(_ presenter: OTProfilePresenter, profile: OTProfileModel)

    
}


class OTProfilePresenter: NSObject {
    weak var delegate : OTProfileViewPresenterDelegate?

    private let profileDataSource: OTProfileDataSource
    
    private(set) var pinnedRepositories = [OTRepositoryModel]()
    private(set) var starredRepositories = [OTRepositoryModel]()
    private(set) var topRepositories = [OTRepositoryModel]()

    init(profileDataSource: OTProfileDataSource){
        self.profileDataSource = profileDataSource
    }
    
    func getStarredRepoDetails() {
        profileDataSource.getStarredRepoDetails { (repositories) in
            self.starredRepositories = repositories
            self.delegate?.starredRepositoriesUpdated(self, repositories: self.starredRepositories)
        } onFailure: { (error) in
            
        }
    }
    
    func getPinnedRepoDetails() {
        profileDataSource.getPinnedRepoDetails { (repositories) in
            self.pinnedRepositories = repositories
            self.delegate?.pinnedRepositoriesUpdated(self, repositories: self.pinnedRepositories)
        } onFailure: { (error) in
            
        }
    }
    
    func getTopRepoDetails() {
        profileDataSource.getTopRepoDetails { (repositories) in
            self.topRepositories = repositories
            self.delegate?.topRepositoriesUpdated(self, repositories: self.topRepositories)
        } onFailure: { (error) in
            
        }
    }
    
    func getProfileDetails() {
        profileDataSource.getProfileDetails { (profile) in
            self.delegate?.profileDetailsUpdated(self, profile: profile)
        } onFailure: { (error) in
            
        }
    }
}
