//
//  ViewController.swift
//  tableViewPractice
//
//  Created by JEONGSEOB HONG on 2021/05/01.
//

import UIKit

struct TableCellModel {
    let title: String
    let viewController: UIViewController
}


class ViewController: UIViewController {
    let practiceList = [
        TableCellModel(title: "TableViewSwipeActions", viewController: SwipeActionViewController()),
        TableCellModel(title: "TableViewCellRoundCorner", viewController: CellRoundCornerViewController()),
        TableCellModel(title: "TableViewMoveAndDeleteCell", viewController: MoveAndDeleteCellViewController()),
        TableCellModel(title: "TableViewPagenation", viewController: PaginationViewController()),
        TableCellModel(title: "TableViewCarouselCollectionView", viewController: CarouselCollectionTableViewController()),
        TableCellModel(title: "TableViewHeader", viewController: HeaderViewController())
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        practiceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = practiceList[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = practiceList[indexPath.row].viewController
        viewController.title =  practiceList[indexPath.row].title
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
    
}
