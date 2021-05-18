//
//  CarouselCollectionViewController.swift
//  tableViewPractice
//
//  Created by JEONGSEOB HONG on 2021/05/18.
//

import UIKit

class CarouselCollectionTableViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            CarouselCollectionTableViewCell.self,
            forCellReuseIdentifier: CarouselCollectionTableViewCell.identifier)
        return tableView
    }()
    
    private let data: [CarouselCollectionTableViewCellViewModel] = [
        CarouselCollectionTableViewCellViewModel(titleCollectionViewCellViewModel: [
            TitleCollectionViewCellViewModel(name: "apple", backgroundColor: .systemBlue),
            TitleCollectionViewCellViewModel(name: "banana", backgroundColor: .purple),
            TitleCollectionViewCellViewModel(name: "pine", backgroundColor: .orange),
            TitleCollectionViewCellViewModel(name: "grape", backgroundColor: .yellow)
        ]),
        CarouselCollectionTableViewCellViewModel(titleCollectionViewCellViewModel: [
            TitleCollectionViewCellViewModel(name: "11", backgroundColor: .systemBlue),
            TitleCollectionViewCellViewModel(name: "22", backgroundColor: .purple),
            TitleCollectionViewCellViewModel(name: "33", backgroundColor: .orange),
            TitleCollectionViewCellViewModel(name: "44", backgroundColor: .yellow)
        ]),
        CarouselCollectionTableViewCellViewModel(titleCollectionViewCellViewModel: [
            TitleCollectionViewCellViewModel(name: "aa", backgroundColor: .systemBlue),
            TitleCollectionViewCellViewModel(name: "bb", backgroundColor: .purple),
            TitleCollectionViewCellViewModel(name: "cc", backgroundColor: .orange),
            TitleCollectionViewCellViewModel(name: "dd", backgroundColor: .yellow)
        ])
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
}


extension CarouselCollectionTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CarouselCollectionTableViewCell.identifier,
                for: indexPath) as? CarouselCollectionTableViewCell
        else { fatalError() }
        cell.configure(with: data[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width / 2
    }
    
}

extension CarouselCollectionTableViewController: CarouselCollectionTableViewCellDelegate {
    func carouselCollectionTableViewCell(
        _ tableViewCell: UITableViewCell,
        didSelectWith titleCollectionViewCellViewModel: TitleCollectionViewCellViewModel) {
        let alert = UIAlertController(title: titleCollectionViewCellViewModel.name,
                                      message: "selected",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .cancel))
        present(alert, animated: true)
    }
}

