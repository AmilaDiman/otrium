//
//  OTProfilePresenter.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

protocol OTProfileViewDelegate: NSObjectProtocol {
    func displayProfile(description:(String))
}

class OTProfilePresenter: NSObject {
    private let profileDataSource: OTProfileDataSource
    private let repositoryDataSource: OTRepositoryDataSource

    init(profileDataSource: OTProfileDataSource, repositoryDataSource: OTRepositoryDataSource){
        self.profileDataSource = profileDataSource
        self.repositoryDataSource = repositoryDataSource
    }
}
