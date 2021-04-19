//
//  ViewController.swift
//  SideMenu
//
//  Created by JEONGSEOB HONG on 2021/04/19.
//

import UIKit

class ContainerViewController: UIViewController {
    
    enum MenuState {
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed
    
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    var navVC: UINavigationController?
    lazy var infoVC = InfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addChildVCs()
    }
    
    private func addChildVCs() {
        // Menu
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        menuVC.delegate = self
        
        // Home
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }
    
    func toggleMenu(completion: ( () -> Void)?) {
        // Animate the menu
        switch menuState {
        case .closed:
            // open it
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 100
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opened
                }
            }
        case .opened:
            // close it
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = 0
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
    
}

extension ContainerViewController: HomeViewControllerDelegate {
    func didTapMenuButton() {
        toggleMenu(completion: nil)
    }
}


extension ContainerViewController: MenuViewControllerDelegate {
    func didSelect(menuItem: MenuViewController.MenuOption) {
        toggleMenu { [weak self] in
            switch menuItem {
            case .home:
                guard let infoVC = self?.infoVC else { return }
                infoVC.view.removeFromSuperview()
                infoVC.didMove(toParent: nil)
                self?.homeVC.title = "home!!again"
                
                break
            case .info:
                // Add info child
                guard let infoVC = self?.infoVC else { return }
                self?.homeVC.addChild(infoVC)
                self?.homeVC.view.addSubview(infoVC.view)
                infoVC.view.frame = self?.view.frame ?? .zero
                infoVC.didMove(toParent: self?.homeVC)
                self?.homeVC.title = infoVC.title
                break
            case .appRating:
                break
            case .shareApp:
                break
            case .settings:
                break
            }
        }
    }
    
    
}
