//
//  NewsResponse.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/6.
//

import Foundation

struct SearchMusicResponse: Codable {
    let resultCount: Int
    let results: [SearchResult]
}

struct SearchResult: Codable {
    let artistName: String
    let trackName: String?
    let longDescription: String?
    let artworkUrl100: String
    let previewUrl: String?
}
