//
//  HeaderViewController.swift
//  TableViewPractice
//
//  Created by jeongseob hong on 2021/05/21.
//

import UIKit

class HeaderViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension HeaderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
    // use for simple header text
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        "section - \(section)"
//    }
    
    // user for custom header View!
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerInSection = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        headerInSection.backgroundColor = .red
        let imageView = UIImageView(image: UIImage(systemName: "house"))
        headerInSection.addSubview(imageView)
        imageView.frame = CGRect(x: 5,
                                 y: 5,
                                 width: headerInSection.frame.size.height-10,
                                 height: headerInSection.frame.size.height-10)
        
        let label  = UILabel(frame: CGRect(x: 10 + imageView.frame.size.width,
                                           y: 5,
                                           width: headerInSection.frame.size.width - 15 - imageView.frame.size.width,
                                           height: headerInSection.frame.size.height - 10))
        headerInSection.addSubview(label)
        label.text = "Custom Section Header: \(section)"
        return headerInSection
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello World: section: \(indexPath.section) | row: \(indexPath.row)"
        return cell
    }
    
}
