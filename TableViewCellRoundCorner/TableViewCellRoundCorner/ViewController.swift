//
//  ViewController.swift
//  TableViewCellRoundCorner
//
//  Created by JEONGSEOB HONG on 2021/04/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.layer.cornerRadius = 40
    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Test Cell"
        if indexPath.row == 0 {
            // First Cell
            cell.contentView.roundCorners(corners: [.topLeft, .topRight], radius: 40)
        } else if indexPath.row == (tableView.numberOfRows(inSection: indexPath.section) - 1) {
            // Last Cell
            cell.contentView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 40)
            
        }
        return cell
    }
    
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
}
