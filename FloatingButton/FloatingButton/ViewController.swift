//
//  ViewController.swift
//  FloatingButton
//
//  Created by JEONGSEOB HONG on 2021/07/11.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .systemPink
        
        // Title
//        button.setTitle("This is Button", for: .normal)
//        button.setTitleColor(.white, for: .normal)
        
        // Image
        let image = UIImage(systemName: "plus",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 40,
                                                                           weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        
        // Shadow
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        
        // Corner Radius
        button.layer.cornerRadius = 40
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: view.frame.size.width - 100,
                              y: view.frame.size.height - 120,
                              width: 80,
                              height: 80)
    }


}

