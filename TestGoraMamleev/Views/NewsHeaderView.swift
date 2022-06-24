//
//  NewsHeaderView.swift
//  TestGoraMamleev
//
//  Created by Andrey on 20.06.2022.
//

import UIKit

class NewsHeaderView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(title: String?) {
        titleLabel.text = title?.capitalized
    }
    
    private  func configLayout() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(20)
        }
    }
}
