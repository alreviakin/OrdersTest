//
//  AuthViewController.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 01.12.2023.
//

import UIKit
import Firebase
import FirebaseAuth



class AuthViewController: UIViewController {
    
    private var authView = AuthView()
    
    override func loadView() {
        self.view = authView
        authView.delegate = self
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AuthViewController: AuthViewControllerDelegate {
    func signIn() {
        let email = authView.getEmail()
        let password = authView.getPassword()
        
        if email == "" || email == nil || password == nil || password == "" {
            authView.showError()
        } else {
            FirebaseManager.shared.logIn(email: email!, passworrd: password!) {[weak self] error in
                guard let self else { return }
                if error != nil {
                    self.authView.showError()
                } else {
                    let vc = TabBarViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
            
        }
    }
}
