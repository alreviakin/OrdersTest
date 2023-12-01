//
//  ProfileView.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 01.12.2023.
//

import UIKit

class ProfileView: UIView {
    
    weak var delegate: ProfileViewControllerDelegate?
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MyOrders"
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        return label
    }()
    private lazy var profileButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    func didLoad() {
        addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}

@objc extension ProfileView: ProfileViewDelegate {
  
    func transitionToProfile() {
        delegate?.transitionToProfile()
    }
    
    func transitionToOrders() {
        delegate?.transitionToOrders()
    }
}
