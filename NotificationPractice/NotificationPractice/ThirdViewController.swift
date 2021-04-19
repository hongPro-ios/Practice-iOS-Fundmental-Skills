//
//  ThirdViewController.swift
//  NotificationPractice
//
//  Created by JEONGSEOB HONG on 2021/04/16.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: Notification.Name("colorChanged"), object: nil)
        
    }
    
    @objc func notificationReceived() {
        view.backgroundColor = .red
    }


}
