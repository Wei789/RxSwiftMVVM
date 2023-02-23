//
//  APITarget.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/14.
//

import Foundation
import Moya

enum ItunesAPI {
    case searchMusic
}

extension ItunesAPI: TargetType {
    var sampleData: Data {
        switch self {
        case .searchMusic:
            return "".data(using: .utf8)!
        }
    }
    
    var baseURL: URL {
        Network.baseURL
    }
    
    var path: String {
        switch self {
        case .searchMusic:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchMusic:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .searchMusic:
            return nil
        }
    }
    
    var task: Task {
        switch self {
        case .searchMusic:
            return .requestPlain
        }
    }
}
