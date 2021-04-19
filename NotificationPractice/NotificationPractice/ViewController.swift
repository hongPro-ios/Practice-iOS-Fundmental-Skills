//
//  ViewController.swift
//  NotificationPractice
//
//  Created by JEONGSEOB HONG on 2021/04/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapButton(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("colorChanged"), object: nil)
        view.backgroundColor = .red
    }
    
}

