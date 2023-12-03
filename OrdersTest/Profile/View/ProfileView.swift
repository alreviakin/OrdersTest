//
//  ProfileView.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 01.12.2023.
//

import UIKit

class ProfileView: BaseMainView {
    
    weak var delegate: ProfileViewControllerDelegate?
    
    private var profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    private var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Имя Фамилия"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()
    private var ordersTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Выполненные заказы"
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    private var orderCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25"
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private lazy var logOutButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Выход", for: .normal)
        btn.backgroundColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        btn.layer.cornerRadius = 12
        btn.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        return btn
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
        
        addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(ordersTitleLabel)
        addSubview(orderCountLabel)
        addSubview(logOutButton)
        
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
//
//            menuButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
//            menuButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 30),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            
            usernameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 25),
            usernameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            ordersTitleLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 80),
            ordersTitleLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            
            orderCountLabel.centerYAnchor.constraint(equalTo: ordersTitleLabel.centerYAnchor),
            orderCountLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            logOutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            logOutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logOutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            logOutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            logOutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

@objc extension ProfileView: ProfileViewDelegate {
    func logOut() {
        delegate?.logOut()
    }
}

extension ProfileView {
    func setLabels(user: User) {
        usernameLabel.text = user.fullName
        orderCountLabel.text = user.countOrders
    }
}
