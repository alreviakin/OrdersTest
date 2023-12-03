//
//  MapsViewController.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 02.12.2023.
//

import UIKit

class MapsViewController: UIViewController {
    
    private let mapsView = MapsView()
    
    override func loadView() {
        self.view = mapsView
        FirebaseManager.shared.getOrders { orders in
            for order in orders {
                print(order.position)
                guard order.position != nil else {
                    continue
                }
                DispatchQueue.main.async {
                    self.mapsView.setMarker(title: order.name, latitude: order.position!.latitude, longitude: order.position!.longitude)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
