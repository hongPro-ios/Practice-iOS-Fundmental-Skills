//
//  ViewController.swift
//  TableViewSwipeActions
//
//  Created by JEONGSEOB HONG on 2021/04/20.
//

import UIKit

class User {
    var name: String
    var isFavorite: Bool
    var isMuted: Bool
    
    init(name: String,
         isFavorite: Bool,
         isMuted: Bool)
    {
        self.name = name
        self.isFavorite = isFavorite
        self.isMuted = isMuted
    }
}

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    var users: [User] = [
        "test1",
        "test2",
        "test3",
        "test4",
        "test5",
        "test6",
        
    ].compactMap { User(name: $0, isFavorite: false, isMuted: false)}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        title = "Swipe Action"
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        if user.isFavorite {
            cell.backgroundColor = .systemBlue
        }
        else if user.isMuted {
            cell.backgroundColor = .systemOrange
        }
        else {
            cell.backgroundColor = nil
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            self.users.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let user = users[indexPath.row]
        let favoriteActionTitle = user.isFavorite ? "Unfavorite" : "Favorite"
        let muteActionTitle = user.isMuted ? "Unmute" : "Mute"
        
        let favoriteAction = UITableViewRowAction(style: .normal, title: favoriteActionTitle) { _, indexPath in
            self.users[indexPath.row].isFavorite.toggle()
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        let muteAction = UITableViewRowAction(style: .normal, title: muteActionTitle) { _, indexPath in
            self.users[indexPath.row].isMuted.toggle()
            self.tableView.reloadRows(at: [indexPath], with: .bottom)
        }
        
        favoriteAction.backgroundColor = .systemBlue
        muteAction.backgroundColor = .orange
        
        return [deleteAction, favoriteAction, muteAction]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    
}
