//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class ScreenEdgePanGestureViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.isHidden = true
        blueView.isHidden = false
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    @IBAction func handleScreenEdgePan(_ sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state == .ended {
            UIView.transition(
                with: containerView,
                duration: 1,
                options: [.transitionFlipFromRight],
                animations: {
                    self.redView.isHidden = !self.redView.isHidden
                    self.blueView.isHidden = !self.blueView.isHidden
                },
                completion: nil)
        }
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return UIRectEdge.all // 이렇게 설정하면 커스텀한 screen edge pan 이 우선으로 된다
    }
    
}
