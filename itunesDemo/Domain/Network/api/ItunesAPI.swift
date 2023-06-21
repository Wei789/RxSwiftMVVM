//
//  APITarget.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/14.
//

import Foundation
import Moya

enum ItunesAPI {
    case search(term: String)
}

extension ItunesAPI: TargetType {
    var sampleData: Data {
        switch self {
        case .search:
            return "".data(using: .utf8)!
        }
    }
    
    var baseURL: URL {
        Network.baseURL
    }
    
    var path: String {
        switch self {
        case .search:
            return "search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .search:
            return nil
        }
    }
    
    var task: Task {
        switch self {
        case .search(let term):
            return .requestParameters(parameters: ["term": term], encoding: URLEncoding.default)
        }
    }
}
