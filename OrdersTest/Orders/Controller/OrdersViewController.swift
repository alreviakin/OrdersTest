//
//  OrdersViewController.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 02.12.2023.
//

import UIKit

class OrdersViewController: UIViewController {
    
    lazy var ordersView = OrdersView(self)

    
    override func loadView() {
        super.loadView()
        ordersView.baseDelegate = self
        ordersView.tableDelegate = self
        self.view = ordersView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension OrdersViewController: BaseControllerDelegaete {
    func transitionToOrders() {
        //
    }
    
    func transitionToProfile() {
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

extension OrdersViewController: OrdersTableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? OrderTableViewCell else {
            return UITableViewCell()
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotesCell
//
//                let m = NotesModel()
//
//                if indexPath.row == 3 {
//                    m.name = "This is a very long caption. It will demonstrate how the cell height is auto-sized when the text is long enough to wrap to multiple lines."
//                } else {
//                    m.name = "Caption \(indexPath.row)"
//                }
//
//                cell.configure(with: m)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}



