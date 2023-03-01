//
//  Network.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/6.
//

import Foundation
import RxSwift
import Moya

protocol Networking {
    func request<T: Codable>(_ target: TargetType) -> Single<T>
}

class Network: Networking {
    static let baseURL = URL(string: "https://itunes.apple.com/")!
    private let provider: MoyaProvider<MultiTarget>!
    
    init(provider: MoyaProvider<MultiTarget>? = nil) {
        self.provider = provider ?? MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    }
    
    func request<T: Codable>(_ target: TargetType) -> Single<T> {
        provider
            .rx
            .request(MultiTarget(target))
            .filterSuccessfulStatusCodes()
            .map(T.self)
    }
}
