//
//  NewsDataSource.swift
//  TestGoraMamleev
//
//  Created by Andrey on 18.06.2022.
//

import UIKit

class NewsDataSource: NSObject {
    
    var news = [[News]]()
    var newsCompletion: NewsCompletion?
}

extension NewsDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.reuseID(), for: indexPath) as? CategoryCell else {
            return UITableViewCell()
        }
        cell.setUp(news: news[indexPath.section])
        cell.newsCompletion = { [weak self] news in
            self?.newsCompletion?(news)
        }
        return cell
    }
}
