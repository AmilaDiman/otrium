//
//  OTProfileModel.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit
import Apollo

class OTProfileModel: NSObject {
    var username: String?
    var name: String?
    var email: String?
    var followers: Int?
    var following: Int?
    var imageUrl: String?
    
    func load(resultMap: ResultMap) {
        username = resultMap["login"] as? String
        name = resultMap["name"] as? String
        email = resultMap["email"] as? String ?? "-"
        followers = (resultMap["followers"] as? [String : Any])!["totalCount"] as? Int
        following = (resultMap["following"] as? [String : Any])!["totalCount"] as? Int
        imageUrl = resultMap["avatarUrl"] as? String
    }
}
