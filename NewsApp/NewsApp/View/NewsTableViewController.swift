//
//  ViewController.swift
//  NewsApp
//
//  Created by JEONGSEOB HONG on 2021/05/14.
//

import UIKit
import SafariServices

class NewsTableViewController: UIViewController {
    
    struct Constants {
        static let cellHeight: CGFloat = 150
        static let title = "News"
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            NewsTableViewCell.self,
            forCellReuseIdentifier: NewsTableViewCell.identifier)
        
        return tableView
    }()
    
    private var viewModels = [NewTableViewCellViewModel]()
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.title
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        fetchArticles()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func fetchArticles() {
        APICaller.shared.getTopStories { [weak self] result in
            switch result {
            case .success(let articles):
                self?.articles = articles
                self?.viewModels = articles.compactMap({ articles in
                    NewTableViewCellViewModel(
                        title: articles.title,
                        subtitle: articles.description ?? "No Description",
                        imageURL: URL(string: articles.urlToImage ?? ""))
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension NewsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: NewsTableViewCell.identifier,
                for: indexPath) as? NewsTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let article = articles[indexPath.row]
        guard let url = URL(string: article.url ?? "") else { return }
        let viewController = SFSafariViewController(url: url)
        present(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.cellHeight
    }

}
