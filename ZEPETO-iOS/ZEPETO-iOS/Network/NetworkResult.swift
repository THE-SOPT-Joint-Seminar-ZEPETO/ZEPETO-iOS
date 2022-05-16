//
//  NetworkResult.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
