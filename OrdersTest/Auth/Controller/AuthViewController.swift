//
//  AuthViewController.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 01.12.2023.
//

import UIKit



class AuthViewController: UIViewController {
    
    private var authView = AuthView()
    
    override func loadView() {
        self.view = authView
        authView.didLoad()
        authView.delegate = self
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AuthViewController: AuthViewControllerDelegate {
    func signIn() {
        
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
