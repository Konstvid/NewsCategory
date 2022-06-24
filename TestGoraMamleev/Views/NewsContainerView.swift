//
//  NewsContainerView.swift
//  TestGoraMamleev
//
//  Created by Andrey on 18.06.2022.
//

import UIKit

class NewsContainerView: UIView {
    
    private(set) var tableView = UITableView(frame: .zero, style: .grouped)
    
    init() {
        super.init(frame: .zero)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        tableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.reuseID())
    }
    
    func configureLayout() {
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
