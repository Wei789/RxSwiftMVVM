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
    private let searchKeyword = PublishSubject<String>()
    
    init(useCase: SearchMusicUseCase) {
        self.useCase = useCase
        super.init()
        
        let searchResult = searchKeyword
            .debounce(.milliseconds(1000), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest(search).compactMap { $0.element }
        
        self.input = Input(searchKeyword: searchKeyword.asObserver())
        self.output = Output(music: searchResult.asDriver(),
                             loading: loading.asDriver())
    }
    
    private func search(term: String) -> Observable<Event<[Music]>> {
        useCase.search(term: term)
            .do {[weak self] in if let error = $0.error { self?.errors.onNext(error) } }
            .trackActivity(loading)
    }
}

extension SearchViewModel {
    struct Input {
        let searchKeyword: AnyObserver<String>
    }
    
    struct Output {
        let music: Driver<[Music]>
        let loading: Driver<Bool>
    }
}
