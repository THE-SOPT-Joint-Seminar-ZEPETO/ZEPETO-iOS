//
//  FeedAPI.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/31.
//

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
    
    /// [GET] 피드 조회
    func feedGetAPI(completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AFmanager.request(FeedService.getFeed).responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data, FeedGetResModel.self)
                completion(networkResult)
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    /// [POST] 게시글 작성
    func createPostAPI(content: String, image: UIImage, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AFmanager.upload(
            multipartFormData: FeedService.uploadPost(content: content, image: image).multipart,
            with: FeedService.uploadPost(content: content, image: image)).responseData { response in
                switch response.result {
                    
                case .success:
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let data = response.data else { return }
                    let networkResult = self.judgeStatus(by: statusCode, data, CreatePostResModel.self)
                    
                    completion(networkResult)
                    
                case .failure(let err):
                    print(err.localizedDescription)
                }
                
            }
    }
}
