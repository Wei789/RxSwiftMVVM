//
//  NewsRepository.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/6.
//

import Foundation
import RxSwift

protocol SearchMusicRepository {
}

class SearchMusicRepositoryImpl: SearchMusicRepository {
    private let api: Networking!
    
    init(api: Networking) {
        self.api = api
    }
}
