//
//  ViewController.swift
//  RingAnimation
//
//  Created by JEONGSEOB HONG on 2021/04/08.
//

import UIKit

class ViewController: UIViewController {
    
    let shape = CAShapeLayer()
    let trackShape = CAShapeLayer()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Calorie Goal"
        label.font = .systemFont(ofSize: 30, weight: .light)
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Animate", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let circlePath = UIBezierPath(
            arcCenter: view.center,
            radius: 150,
            startAngle: -(.pi / 2),
            endAngle: .pi * 2,
            clockwise: true
        )
        
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 15
        trackShape.strokeColor = UIColor.lightGray.cgColor
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        
        label.sizeToFit()
        label.center = view.center
        button.frame = CGRect(x: 20,
                              y: view.frame.size.height - 70,
                              width: view.frame.size.width - 40,
                              height: 50)
        
        view.layer.addSublayer(trackShape)
        view.layer.addSublayer(shape)
        view.addSubview(label)
        view.addSubview(button)
    }
    
    @objc func didTapButton() {
        // Animate
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }
    
}

