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
        FirebaseManager.shared.getUser { [weak self] user in
            guard let self, let user else { return }
            profileView.setLabels(user: user)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProfileViewController: ProfileViewControllerDelegate {
    func logOut() {
        FirebaseManager.shared.logOut() { error in
            guard error == nil else { return }
            let vc = AuthViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        
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
