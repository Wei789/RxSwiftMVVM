//
//  NewsUsecase.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/7.
//

import Foundation
import RxSwift

protocol SearchMusicUseCase {
}

class SearchMusicUseCaseImpl: SearchMusicUseCase {
    private let repo: SearchMusicRepository!
    
    init(repo: SearchMusicRepository) {
        self.repo = repo
    }
}
