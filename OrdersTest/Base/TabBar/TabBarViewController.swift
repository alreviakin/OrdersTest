//
//  TabBarViewController.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 02.12.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        tabBar.backgroundColor = .white
        
        let ordersVC = OrdersViewController()
        ordersVC.tabBarItem = UITabBarItem(title: "Заказы", image: UIImage(systemName: "suitcase.cart"), tag: 0)
        
        let mapsVC = MapsViewController()
        mapsVC.tabBarItem = UITabBarItem(title: "Карта", image: UIImage(systemName: "map"), tag: 1)
        
        setViewControllers([ordersVC, mapsVC], animated: true)
    }
}
