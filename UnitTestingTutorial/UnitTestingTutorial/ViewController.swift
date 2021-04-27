//
//  ViewController.swift
//  UnitTestingTutorial
//
//  Created by JEONGSEOB HONG on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let ferrari = Car(type: .Sport, transmissionMode: .Drive)
        ferrari.start(minutes: 120)
        print(ferrari.miles)
    }


}

