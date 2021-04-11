//
//  ViewController.swift
//  PassData
//
//  Created by JEONGSEOB HONG on 2021/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didGetNotification(_:)),
            name: Notification.Name("text"),
            object: nil)
    }
    
    @objc func  didGetNotification(_ notification: Notification) {
        let text = notification.object as! String?
        label.text = text
    }
    
    
    @IBAction func didTapButton() {
        let vc = storyboard?.instantiateViewController(identifier: "other") as! OtherViewController
        vc.completionHandler = { text in
            self.label.text = text
        }
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true, completion: nil)
    }
    
}

