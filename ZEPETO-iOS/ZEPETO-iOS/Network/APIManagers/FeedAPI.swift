//
//  FeedAPI.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/31.
//

import Foundation
import UIKit
import Alamofire

/*
 ~API: 실제 서버통신을 하기 위해 API를 구현하는 클래스 (BaseAPI를 상속)
 싱글턴으로 접근한다. 앞서 만든 request 함수를 호출하고 Service를 통해 서버통신 수행
 네트워크 결과를 받아와서 처리
 */

class FeedAPI: BaseAPI {
    static let shared = FeedAPI()
    
    private override init() { }
}
