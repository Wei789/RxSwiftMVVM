//
//  NewsUsecase.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/7.
//

import Foundation
import RxSwift

protocol SearchMusicUseCase {
    func search(term: String) -> Observable<Event<[Music]>>
}

class SearchMusicUseCaseImpl: SearchMusicUseCase {
    private let repo: SearchMusicRepository!
    
    init(repo: SearchMusicRepository) {
        self.repo = repo
    }

    func search(term: String) -> Observable<Event<[Music]>> {
        repo.search(term: term)
    }
}
