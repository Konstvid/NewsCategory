//
//  NewsViewModel.swift
//  TestGoraMamleev
//
//  Created by Andrey on 18.06.2022.
//

import Foundation

class NewsViewModel {
    
    private let network = NetworkService()
    private let router = Router()
   
    func openURL(news: News) {
        router.show(urlBrowser: news.url)
    }
    
    func getNews(completion: @escaping ([[News]]) -> ()) {
        network.getNews { result in
            switch result {
            case .success(let response):
                completion(response.sortedNews())
            case .failure(let error):
                print(error)
            }
        }
    }
}
