//
//  ProfileViewController.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 01.12.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileView = ProfileView()
    
    override func loadView() {
        self.view = profileView
        profileView.didLoad()
        profileView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }
}

extension ProfileViewController: ProfileViewControllerDelegate {
    func transitionToProfile() {
        
    }
    
    func transitionToOrders() {
        
    }
    
    
}
