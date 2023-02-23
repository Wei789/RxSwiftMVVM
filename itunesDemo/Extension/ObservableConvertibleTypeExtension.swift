//
//  ObservableConvertibleTypeExtension.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/7.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableConvertibleType {
    func asDriver() -> Driver<Element> {
        return asDriver(onErrorDriveWith: .never())
    }
    
    func asSignal() -> Signal<Element> {
        return asSignal(onErrorSignalWith: .never())
    }
}

class ViewModel {
    let errors = PublishSubject<Error>()
    let loading = ActivityIndicator()
}

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input! { get }
    var output: Output! { get }
}
