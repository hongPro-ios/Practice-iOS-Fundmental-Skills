//
//  ViewController.swift
//  AnimationPractice
//
//  Created by JEONGSEOB HONG on 2021/04/14.
//

import UIKit
import ViewAnimator

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    let data = ["Zoom", "Rotate", "Mix", "Random"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = .blue
        if indexPath.row.isMultiple(of: 2) {
            cell.backgroundColor = .red
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let vc = FirstViewController()
            present(vc, animated: true)
        } else if indexPath.row == 1 {
            let vc = SecondViewController()
            present(vc, animated: true)
        } else if indexPath.row == 2 {
            let vc = ThirdViewController()
            present(vc, animated: true)
        } else if indexPath.row == 3 {
            let vc = RandomViewController()
            present(vc, animated: true)
        }
    }
}
