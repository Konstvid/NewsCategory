//
//  NewsCellCollectionViewCell.swift
//  TestGoraMamleev
//
//  Created by Andrey on 21.06.2022.
//

import UIKit
import SDWebImage

class NewsCell: UICollectionViewCell {
    
    private lazy var previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .systemBlue
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 1]
        return gradient
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(news: News) {
        descriptionLabel.text = news.description
        let url = URL(string: iconURL)
        previewImageView.sd_setImage(with: url)
    }
    
    private func configureLayout() {
        contentView.addSubview(previewImageView)
        gradient.frame = bounds
        previewImageView.layer.addSublayer(gradient)
        previewImageView.addSubview(descriptionLabel)
        
        previewImageView.snp.makeConstraints {
            $0.leading.top.equalTo(5)
            $0.trailing.bottom.equalTo(-5)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(10)
            $0.trailing.bottom.equalTo(-10)
            $0.top.greaterThanOrEqualTo(10)
        }
    }
    
    class func reuseID() -> String {
        NSStringFromClass(CategoryCell.self).components(separatedBy: ".").last ?? ""
    }
}
