//
//  ViewModel.swift
//  itunesDemo
//
//  Created by user on 2023/6/21.
//

import Foundation

class ViewModel {
    let errorRouter = ErrorRouter()
    let loading = ActivityIndicator()
}

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    var input: Input! { get }
    var output: Output! { get }
}
