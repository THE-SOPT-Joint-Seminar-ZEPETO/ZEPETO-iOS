//
//  CreatePostResModel.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/06/02.
//

import Foundation

// MARK: - CreatePostResModel
struct CreatePostResModel: Codable {
    let id: String
    let content: String
    let link: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case content, link
    }
}
