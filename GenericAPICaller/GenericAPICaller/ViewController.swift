//
//  ViewController.swift
//  GenericAPICaller
//
//  Created by JEONGSEOB HONG on 2021/07/03.
//

import UIKit

class ViewController: UIViewController {
    
    struct Constants {
        static let usersURL = URL(string: "https://jsonplaceholder.typicode.com/users")
        static let todoListURL = URL(string: "https://jsonplaceholder.typicode.com/todos")
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    private var models: [Codable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //        fetchUsers()
        fetchTodoList()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func fetchUsers() {
        URLSession.shared.request(url: Constants.usersURL, expecting: [User].self) { [weak self] result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self?.models = users
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchTodoList() {
        URLSession.shared.request(url: Constants.todoListURL, expecting: [ToDoList].self) { [weak self] result in
            switch result {
            case .success(let toDoList):
                DispatchQueue.main.async {
                    self?.models = toDoList
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch models[indexPath.row] {
        case let user as User:
            cell.textLabel?.text = user.name
        case let todoList as ToDoList:
            cell.textLabel?.text = todoList.title
            cell.accessoryType = todoList.completed ? .checkmark : .none
        default:
            break
        }
        
        return cell
    }
    
}
