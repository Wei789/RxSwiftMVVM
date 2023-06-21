//
//  NewsRepository.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/6.
//

import Foundation
import RxSwift

protocol SearchMusicRepository {
    func search(term: String) -> Observable<Event<[Music]>>
}

class SearchMusicRepositoryImpl: SearchMusicRepository {
    private let api: Networkable!
    
    init(api: Networkable) {
        self.api = api
    }
    
    func search(term: String) -> Observable<Event<[Music]>> {
        api.request(ItunesAPI.search(term: term))
            .map { (data: SearchMusicResponse) in
                data.results.map { item in
                    Music(artworkUrl100: item.artworkUrl100,
                          longDescription: item.longDescription ?? "",
                          hasLongDescription: item.longDescription != nil)
                }
            }
            .asObservable()
            .materialize()
    }
}

struct Music {
    let artworkUrl100: String
    let longDescription: String
    let hasLongDescription: Bool
}
