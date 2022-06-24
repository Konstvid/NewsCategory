//
//  NewsCell.swift
//  TestGoraMamleev
//
//  Created by Andrey on 18.06.2022.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    var newsCompletion: NewsCompletion?
    private var collectionView: UICollectionView?
    private let collectionDataSource = CollectionDataSource()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(news: [News]) {
        collectionDataSource.news = news
        collectionView?.reloadData()
    }
    
    private func configureUI() {
        setupCollectionView()
    }
    
    private func configLayout() {
        collectionView?.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .zero
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseID())
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = collectionDataSource
        collectionView?.contentInset = UIEdgeInsets(top: .zero, left: 20, bottom: .zero, right: 20)
        collectionView?.backgroundColor = .grayColor
        contentView.addSubview(collectionView ?? UICollectionView())
    }
    
    class func reuseID() -> String {
        NSStringFromClass(CategoryCell.self).components(separatedBy: ".").last ?? ""
    }
}

extension CategoryCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width / 2 - 30, height: collectionView.bounds.height)
    }
}

extension CategoryCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        newsCompletion?(collectionDataSource.news[indexPath.item])
    }
}
