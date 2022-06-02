//
//  FeedService.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/31.
//

import Foundation
import Alamofire
import UIKit

/*
 AuthRouter : 여러 Endpoint들을 갖고 있는 enum
 TargetType을 채택해서 path, method, header, parameter를 각 라우터에 맞게 request를 만든다.
 */

enum FeedService {
    case uploadPost(content: String, image: UIImage)
}

extension FeedService: TargetType {
    
    var path: String {
        switch self {
        case .uploadPost:
            return "/feed"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .uploadPost:
            return .post
        
        }
    }
    
    var header: HeaderType {
        switch self {
        case .uploadPost:
            return .multiPart
        }
    }
    
    var multipart: MultipartFormData {
        switch self {
        case .uploadPost(let content, let image):
            let multiPart = MultipartFormData()
            
            let contentData = content.data(using: .utf8) ?? Data()
            let imageData = image.pngData() ?? Data()
            
            multiPart.append(contentData, withName: "content")
            multiPart.append(imageData, withName: "image", fileName: "postImage.png", mimeType: "image/png")
            
            return multiPart
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .uploadPost:
            return .requestPlain
        }
    }
}
