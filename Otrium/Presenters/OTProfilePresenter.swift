//
//  OTProfilePresenter.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit
import Apollo

//MARK:- OTProfileViewPresenterDelegate

protocol OTProfileViewPresenterDelegate: class {
    func pinnedRepositoriesUpdated(_ presenter: OTProfilePresenter, repositories: [OTRepositoryModel])
    func starredRepositoriesUpdated(_ presenter: OTProfilePresenter, repositories: [OTRepositoryModel])
    func topRepositoriesUpdated(_ presenter: OTProfilePresenter, repositories: [OTRepositoryModel])
    func profileDetailsUpdated(_ presenter: OTProfilePresenter, profile: OTProfileModel)
    func showError(_ presenter: OTProfilePresenter, error: String)
}

class OTProfilePresenter: NSObject {
    //MARK:- Public variables
    
    /// Delegate for presentes actions
    weak var delegate : OTProfileViewPresenterDelegate?

    //MARK:- Private variables

    /// Data source for profile;repo details
    private let profileDataSource: OTProfileDataSource
    
    /// Array of pinned repos
    private(set) var pinnedRepositories = [OTRepositoryModel]()
    
    /// Array of starred repos
    private(set) var starredRepositories = [OTRepositoryModel]()
    
    /// Array of top repos
    private(set) var topRepositories = [OTRepositoryModel]()

    //MARK:- Inits

    init(profileDataSource: OTProfileDataSource){
        self.profileDataSource = profileDataSource
    }
    
    //MARK:- Public methods
    
    /// Retrieves repo details from cache or network when available
    public func getStarredRepoDetails(callBack: ((_ repositories: [OTRepositoryModel]) -> Void)? = nil) {
        profileDataSource.getStarredRepoDetails { (repositories) in
            self.starredRepositories = repositories
            self.delegate?.starredRepositoriesUpdated(self, repositories: self.starredRepositories)
            callBack?(repositories)
        } onFailure: { (error) in
            //TODO: handle errors
        }
    }
    
    /// Retrieves repo details from cache or network when available
    public func getPinnedRepoDetails(callBack: ((_ repositories: [OTRepositoryModel]) -> Void)? = nil) {
        profileDataSource.getPinnedRepoDetails { (repositories) in
            self.pinnedRepositories = repositories
            self.delegate?.pinnedRepositoriesUpdated(self, repositories: self.pinnedRepositories)
            callBack?(repositories)
        } onFailure: { (error) in
            //TODO: handle errors
        }
    }
    
    /// Retrieves repo details from cache or network when available
    public func getTopRepoDetails(callBack: ((_ repositories: [OTRepositoryModel]) -> Void)? = nil) {
        profileDataSource.getTopRepoDetails { (repositories) in
            self.topRepositories = repositories
            self.delegate?.topRepositoriesUpdated(self, repositories: self.topRepositories)
            callBack?(repositories)
        } onFailure: { (error) in
            //TODO: handle errors
        }
    }
    
    /// Retrieves profile details from cache or network when available
    public func getProfileDetails() {
        profileDataSource.getProfileDetails { (profile) in
            self.delegate?.profileDetailsUpdated(self, profile: profile)
        } onFailure: { (error) in
            self.delegate?.showError(self, error: error)
            //TODO: handle errors
        }
    }
}
