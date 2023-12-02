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
        profileView.delegate = self
        profileView.baseDelegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProfileViewController: ProfileViewControllerDelegate {
    func logOut() {
        dismiss(animated: true)
    }
}

extension ProfileViewController: BaseControllerDelegaete {
    func transitionToOrders() {
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func transitionToProfile() {
        //
    }
    
    
}
