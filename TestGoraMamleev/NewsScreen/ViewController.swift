//
//  ViewController.swift
//  TestGoraMamleev
//
//  Created by Andrey on 18.06.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let viewModel = NewsViewModel()
    private let dataSource = NewsDataSource()
    private let newsContainerView = NewsContainerView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configereUI()
        configureLayout()
        bind()
    }
    
   private func configereUI() {
        newsContainerView.tableView.delegate = self
        newsContainerView.tableView.dataSource = dataSource
    }
    
    private func configureLayout() {
        view.addSubview(newsContainerView)
        
        newsContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func bind() {
        viewModel.getNews { [weak self] news in
            DispatchQueue.main.async {
                self?.dataSource.news = news
                self?.newsContainerView.tableView.reloadData()
            }
        }
        
        dataSource.newsCompletion = { [weak self] news in 
            self?.viewModel.openURL(news: news)
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = NewsHeaderView()
        let title = dataSource.news[section].first?.category?.rawValue
        view.setUp(title: title)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        65
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        235
    }
}
