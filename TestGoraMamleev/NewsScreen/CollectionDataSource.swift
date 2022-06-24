//
//  CollectionDataSource.swift
//  TestGoraMamleev
//
//  Created by Andrey on 21.06.2022.
//

import Foundation
import UIKit

class CollectionDataSource: NSObject {
    
    var news = [News]()
}

extension CollectionDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.reuseID(), for: indexPath) as? NewsCell else {
            return UICollectionViewCell()
        }
        item.setUp(news: news[indexPath.item])
        return item
    }
}
