//
//  OTRepositoryModel.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit
import Apollo

class OTRepositoryModel: NSObject {
    var username: String?
    var title: String?
    var repoDescription: String?
    var starCount: Int?
    var language: String?
    var imageUrl: String?
    
    func load(resultMap: ResultMap) {
        title = resultMap["name"] as? String
        repoDescription = resultMap["description"] as? String
        starCount = resultMap["stargazerCount"] as? Int
        username = (resultMap["owner"] as? [String : Any])!["login"] as? String
        imageUrl = (resultMap["owner"] as? [String : Any])!["avatarUrl"] as? String
        language = (resultMap["primaryLanguage"] as? [String : Any])?["name"] as? String
    }
}

