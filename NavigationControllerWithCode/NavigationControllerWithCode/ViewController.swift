//
//  ViewController.swift
//  NavigationControllerWithCode
//
//  Created by JEONGSEOB HONG on 2021/04/05.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController"
        setupUI()
        setupViewStack()
        setupEvents()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBlue
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 8, y: 100, width: 300, height: 52)
        button.setTitle("present(navVC, animated: true)", for: .normal)
    }
    
    private func setupViewStack() {
        view.addSubview(button)
    }
    
    private func setupEvents() {
        button.addTarget(
            self,
            action: #selector(didTapButton),
            for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let rootViewController = SecondViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    
    
}

class SecondViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SecondViewController"
        
        setupUI()
        setupEvents()
        setupViewStack()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Dismiss",
            style: .plain,
            target: self,
            action: #selector(dismissSelf)
        )
    }
    
    private func setupUI() {
        view.backgroundColor = .systemRed
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 8, y: 100, width: 300, height: 52)
        button.setTitle("navigationController?.pushViewController(vc, animated: true)", for: .normal)
    }
    
    private func setupViewStack() {
        view.addSubview(button)
    }
    
    private func setupEvents() {
        button.addTarget(
            self,
            action: #selector(didTapButton),
            for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let thirdViewController = ThirdViewController()
        thirdViewController.view.backgroundColor = .white
        thirdViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Dismiss",
            style: .plain,
            target: self,
            action: #selector(dismissSelf)
        )
        let navigationController2 = UINavigationController()
        navigationController2.pushViewController(thirdViewController, animated: true)
        present(navigationController2, animated: true, completion: nil)
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
