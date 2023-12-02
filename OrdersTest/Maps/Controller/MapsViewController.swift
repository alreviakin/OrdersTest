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
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
