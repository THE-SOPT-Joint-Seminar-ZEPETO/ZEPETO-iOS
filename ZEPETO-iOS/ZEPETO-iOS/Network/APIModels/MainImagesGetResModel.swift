//
//  MainImagesGetResModel.swift
//  ZEPETO-iOS
//
//  Created by Juhyeon Byun on 2022/06/02.
//

import Foundation

// MARK: - MainImagesGetResModel
struct MainImagesGetResModel: Codable {
    let id, title, description, profileImage: String
    let images: [Image]

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, description, profileImage, images
    }
}

// MARK: - Image
struct Image: Codable {
    let imageURL: String
    let isVideo, isStared: Bool

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case isVideo, isStared
    }
}
