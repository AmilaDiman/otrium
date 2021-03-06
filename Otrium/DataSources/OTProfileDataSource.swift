//
//  OTProfileDataSource.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit
import Apollo

class OTProfileDataSource: NSObject {
    //MARK:- Private variables

    /// Username of prifile to fetch
    private let username = "fabpot" //TODO: hard coded for testing purposes
    
    //MARK:- Public data retrieval methods

    /// Retrieves starred repos for the given user
    /// - Parameters:
    ///   - successCallback: success callback with results of request
    ///   - failureCallback: error callback with error details
    public func getStarredRepoDetails(onSuccess successCallback: ((_ repositories: [OTRepositoryModel]) -> Void)?,
                               onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        OTGraphQLApiManager.shared.apollo.fetch(query: StarredRepositoriesQuery(username: username),
                                                cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
            case .success(let result):
                if let repos = result.data?.user?.starredRepositories.nodes {
                    var repoList = [OTRepositoryModel]()
                    for repo in repos {
                        let model = OTRepositoryModel()
                        model.load(resultMap: repo!.resultMap)
                        repoList.append(model)
                    }
                    
                    successCallback?(repoList)
                }
                
            case .failure(let error):
                failureCallback?(error.localizedDescription)
                print("Error: \(error)")
            }
        }
    }
    
    /// Retrieves pinned repos for the given user
    /// - Parameters:
    ///   - successCallback: success callback with results of request
    ///   - failureCallback: error callback with error details
    public func getPinnedRepoDetails(onSuccess successCallback: ((_ repositories: [OTRepositoryModel]) -> Void)?,
                               onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        OTGraphQLApiManager.shared.apollo.fetch(query: PinnedRepositoriesQuery(username: username),
                                                cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
            case .success(let result):
                if let repos = result.data?.user?.pinnedItems.nodes {
                    var repoList = [OTRepositoryModel]()
                    for repo in repos {
                        let model = OTRepositoryModel()
                        model.load(resultMap: repo!.resultMap)
                        repoList.append(model)
                    }
                    
                    successCallback?(repoList)
                }
                
            case .failure(let error):
                failureCallback?(error.localizedDescription)
                print("Error: \(error)")
            }
        }
    }
    
    /// Retrieves top repos for the given user
    /// - Parameters:
    ///   - successCallback: success callback with results of request
    ///   - failureCallback: error callback with error details
    public func getTopRepoDetails(onSuccess successCallback: ((_ repositories: [OTRepositoryModel]) -> Void)?,
                               onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        OTGraphQLApiManager.shared.apollo.fetch(query: TopRepositoriesQuery(username: username),
                                                cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
            case .success(let result):
                if let repos = result.data?.user?.topRepositories.nodes {
                    var repoList = [OTRepositoryModel]()
                    for repo in repos {
                        let model = OTRepositoryModel()
                        model.load(resultMap: repo!.resultMap)
                        repoList.append(model)
                    }
                    
                    successCallback?(repoList)
                }
                
            case .failure(let error):
                failureCallback?(error.localizedDescription)
                print("Error: \(error)")
            }
        }
    }
    
    /// Retrieves profile details for the given user
    /// - Parameters:
    ///   - successCallback: success callback with results of request
    ///   - failureCallback: error callback with error details
    public func getProfileDetails(onSuccess successCallback: ((_ profile: OTProfileModel) -> Void)?,
                               onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        OTGraphQLApiManager.shared.apollo.fetch(query: ProfileDetailsQuery(username: username),
                                                cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
            case .success(let result):
                if let userDetails = result.data?.user?.resultMap {
                    let model = OTProfileModel()
                    model.load(resultMap: userDetails)
                    successCallback?(model)
                }
                
            case .failure(let error):
                failureCallback?(error.localizedDescription)
                print("Error: \(error)")
            }
        }
    }
}
