//
//  ViewController.swift
//  JustPublisher
//
//  Created by JEONGSEOB HONG on 2021/04/07.
//

import Combine
import UIKit

struct User: Codable {
    let name: String
}

class ViewController: UIViewController {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    var observer: AnyCancellable?
    
    private var users = [User]()
    private var tablaView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tablaView.dataSource = self
        tablaView.frame = view.bounds
        
        view.addSubview(tablaView)
        
        
        observer = fetchUsers()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] users in
                self?.users = users
                self?.tablaView.reloadData()
            })
        
    }
    
    func fetchUsers() -> AnyPublisher<[User], Never> {
        guard let url = url else {
            return Just([]).eraseToAnyPublisher()
        }
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [User].self, decoder: JSONDecoder())
            .catch({ _ in
                Just([])
            })
            .eraseToAnyPublisher()
        
        return publisher
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
}
