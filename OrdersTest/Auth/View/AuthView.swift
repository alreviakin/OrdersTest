//
//  AuthView.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 01.12.2023.
//

import UIKit

class AuthView: UIView {
    
    weak var delegate: AuthViewControllerDelegate?
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MyOrders"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    private var signInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вход"
        label.font = UIFont.systemFont(ofSize: 34)
        return label
    }()
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        textField.textColor = UIColor(red: 146/255, green: 143/255, blue: 143/255, alpha: 1)
        textField.layer.cornerRadius = 10
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:16, height:10))
        textField.leftViewMode = UITextField.ViewMode.always
        textField.leftView = spacerView
        
        textField.placeholder = "Email"
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        textField.textColor = UIColor(red: 146/255, green: 143/255, blue: 143/255, alpha: 1)
        textField.layer.cornerRadius = 10
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:16, height:10))
        textField.leftViewMode = UITextField.ViewMode.always
        textField.leftView = spacerView
        
        textField.placeholder = "Пароль"
        textField.isSecureTextEntry = true
        return textField
    }()
    private lazy var signInButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Вход", for: .normal)
        btn.backgroundColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        btn.layer.cornerRadius = 12
        btn.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return btn
    }()
    private let errorLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Неправильные логин и пароль"
        label.textColor = .red
        label.isHidden = true
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
        self.addSubview(titleLabel)
        self.addSubview(signInLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(signInButton)
        self.addSubview(errorLabel)
    }
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                signInLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
                signInLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
                
                emailTextField.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 30),
                emailTextField.leadingAnchor.constraint(equalTo: signInLabel.leadingAnchor),
                emailTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
                emailTextField.heightAnchor.constraint(equalToConstant: 44),
                
                
                passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
                passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
                passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
                passwordTextField.heightAnchor.constraint(equalToConstant: 44),

                signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
                signInButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
                signInButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
                signInButton.heightAnchor.constraint(equalToConstant: 50),
                
                errorLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
                errorLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
    }
    
}

extension AuthView {
    @objc
    private func signIn() {
        delegate?.signIn()
    }
}

extension AuthView {
    func getEmail() -> String? {
        return emailTextField.text
    }
    
    func getPassword() -> String? {
        return passwordTextField.text
    }
    
    func showError() {
        errorLabel.isHidden = false
        errorLabel.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.errorLabel.alpha = 1
        }
    }
}

