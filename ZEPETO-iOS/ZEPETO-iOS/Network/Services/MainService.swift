//
//  MainService.swift
//  ZEPETO-iOS
//
//  Created by Juhyeon Byun on 2022/06/02.
//

import Foundation
import Alamofire

/*
 AuthRouter : 여러 Endpoint들을 갖고 있는 enum
 TargetType을 채택해서 path, method, header, parameter를 각 라우터에 맞게 request를 만든다.
 */

enum MainService {
    case imagesGet
}

extension MainService: TargetType {
    var method: HTTPMethod {
        switch self {
        case .imagesGet:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .imagesGet:
            return "/images"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .imagesGet:
            return .requestPlain
        }
    }
    
    var header: HeaderType {
        switch self {
        case .imagesGet:
            return .basic
        }
    }
}
