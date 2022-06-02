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
//    case uploadPost(content: String, image: UIImage)
}

extension FeedService: TargetType {
    var method: HTTPMethod {
        switch self {
        
        }
    }
    
    var path: String {
        switch self {
            
        }
    }
    
    var parameters: RequestParams {
        switch self {
            
        }
    }
    
    var header: HeaderType {
        switch self {
            
        }
    }
}
