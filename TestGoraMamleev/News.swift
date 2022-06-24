//
//  News.swift
//  TestGoraMamleev
//
//  Created by Andrey on 18.06.2022.
//

import Foundation

struct NewsResponse: Codable {
    let status: String?
    let sources: [News]
    
    func sortedNews() -> [[News]] {
        var dict = [News.Category: [News]]()
        var array = [[News]?]()
        
        sources.forEach { news in
            guard let category = news.category else { return }
            if var array = dict[category] {
                array.append(news)
                dict[category] = array
            } else {
                dict[category] = [news]
            }
        }
        dict.keys.forEach { key in
            array.append(dict[key])
        }
        return array.compactMap { $0 }
    }
}

struct News: Codable {
    let id: String?
    let name: String?
    let description: String?
    let url: String?
    let category: Category?
    let language: String?
    let country: String?
    
    enum Category: String, Codable {
        case business, entertainment, general, health, science, sports, technology
    }
}
