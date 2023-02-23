//
//  UIViewController.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/7.
//

import Foundation
import UIKit
import Moya

extension UIViewController {
    func handleError(error: Error?) {
        guard let moyaError = error as? MoyaError else {
            print(error?.localizedDescription ?? "")
            return
        }
        
        switch moyaError {
        case .imageMapping(let response):
            print(response)
        case .jsonMapping(let response):
            print(response)
        case .statusCode(let response):
            print(response.statusCode)
            print(response)
        case .stringMapping(let response):
            print(response)
        case .objectMapping(let error, let response):
            print(error.localizedDescription)
            print(response)
        case .encodableMapping(let error):
            print(error)
        case .underlying(let error, let response):
            print(error)
            print(response ?? "")
            let nsError = error as NSError
            print(nsError.code)
            print(nsError.domain)
        case .requestMapping(let url):
            print(url)
        case .parameterEncoding(let error):
            print(error)
        }
    }
}
