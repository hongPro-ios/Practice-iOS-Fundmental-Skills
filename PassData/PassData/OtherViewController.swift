//
//  OtherViewController.swift
//  PassData
//
//  Created by JEONGSEOB HONG on 2021/04/11.
//

import UIKit

class OtherViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    var completionHandler: ((String?) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapButtonCompletionHandlerWay() {
        completionHandler?(textField.text)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func didTapButtonNotificationWay() {
        NotificationCenter.default.post(name: Notification.Name("text"), object: textField.text)
        dismiss(animated: true, completion: nil)
    }


}
