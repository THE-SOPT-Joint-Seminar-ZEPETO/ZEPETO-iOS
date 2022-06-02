//
//  FeedGetResModel.swift
//  ZEPETO-iOS
//
//  Created by 정연 on 2022/06/03.
//

import Foundation

// MARK: - FeedGetResModel
struct FeedGetResModel: Codable {
    let id, image, userName, userProfileImage: String
    let content: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case image, content, userName, userProfileImage
    }
}
