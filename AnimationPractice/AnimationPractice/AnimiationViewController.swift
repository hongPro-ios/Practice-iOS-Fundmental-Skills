//
//  FirstViewController.swift
//  AnimationPractice
//
//  Created by JEONGSEOB HONG on 2021/04/14.
//

import UIKit
import ViewAnimator

class baseAnimationViewController: UIViewController {
    
    let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .purple
    }

}



class FirstViewController: baseAnimationViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        myView.animate(animations: [AnimationType.zoom(scale: 4)], delay: 0, duration: 2)
    }
}

class SecondViewController: baseAnimationViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        myView.animate(animations: [AnimationType.rotate(angle: .pi/5)], delay: 0, duration: 2)
    }
}


class ThirdViewController: baseAnimationViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let subView1 = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        subView1.backgroundColor = .green
        myView.addSubview(subView1)
        
        let animations: [Animation] = [
            AnimationType.rotate(angle: .pi/4),
            AnimationType.zoom(scale: 3)
        ] 

        myView.animate(animations: animations, duration: 2)
    }

}

class RandomViewController: baseAnimationViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        myView.animate(animations: [AnimationType.random()], delay: 0, duration: 2)
    }

}
