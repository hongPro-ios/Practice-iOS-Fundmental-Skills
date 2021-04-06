//
//  ViewController.swift
//  TabBarProgrammatically
//
//  Created by JEONGSEOB HONG on 2021/04/06.
//

import UIKit

class ViewController: UIViewController {
    
    let button: UIButton = {
        var button = UIButton()
        button.setTitle("Open the TabView!", for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.backgroundColor = .green
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc private func didTapButton() {
        let tabBarView = UITabBarController()
        tabBarView.view.backgroundColor = .red
        tabBarView.modalPresentationStyle = .fullScreen
        
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .purple
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .brown
        let navigationViewController = UINavigationController(rootViewController: secondViewController)
        
        
        firstViewController.title = "frist"
        secondViewController.title = "second"
        
        tabBarView.setViewControllers([
            firstViewController,
            navigationViewController
        ], animated: true)
        
        guard let items = tabBarView.tabBar.items else {
            return
        }
        
        items.forEach { item in
            item.image = UIImage(systemName: "house")
        }
        
        present(tabBarView, animated: true, completion: nil)
    }
}

