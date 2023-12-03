//
//  OrdersViewController.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 02.12.2023.
//

import UIKit

class OrdersViewController: UIViewController {
    
    lazy var ordersView = OrdersView(self)
    var orders: [Order] = []

    
    override func loadView() {
        super.loadView()
        ordersView.baseDelegate = self
        ordersView.tableDelegate = self
        self.view = ordersView
        FirebaseManager.shared.getOrders { [weak self] orders in
            guard let self else { return }
            self.orders = orders
            self.ordersView.reloadTable()
        }
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
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? OrderTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(order: orders[indexPath.row])
        return cell
    }
    
}



