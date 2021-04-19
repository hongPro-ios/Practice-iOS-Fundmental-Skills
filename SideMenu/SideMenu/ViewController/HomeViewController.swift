//
//  HomeViewController.swift
//  SideMenu
//
//  Created by JEONGSEOB HONG on 2021/04/19.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didTapMenuButton()
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = "Home"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(didTapMenuButton))
    }
    
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }
}
