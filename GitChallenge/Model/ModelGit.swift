//
//  ModelGit.swift
//  GitChallenge
//
//  Created by Bruno Silva on 14/11/20.
//

import Foundation

struct ModelGit: Codable {
    let owner: Owner
}

// MARK: - Owner
struct Owner: Codable {
    var login: String
    var image: String
    var type: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case image = "avatar_url"
        case type
    }
}


