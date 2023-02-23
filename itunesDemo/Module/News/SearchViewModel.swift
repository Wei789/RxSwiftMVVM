//
//  NewsViewModel.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/7.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel: ViewModel, ViewModelType {
    private(set) var input: Input!
    private(set) var output: Output!

    private let useCase: SearchMusicUseCase!
    
    init(useCase: SearchMusicUseCase) {
        self.useCase = useCase
        super.init()
        
        self.input = Input()
        self.output = Output()
    }
    
}

extension SearchViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
}
