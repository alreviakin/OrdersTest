//
//  BaseMainView.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 02.12.2023.
//

import UIKit

class BaseMainView: UIView {
    
    weak var baseDelegate: BaseControllerDelegaete?
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MyOrders"
        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        return label
    }()
    lazy var menuItems: [UIAction] = [
        UIAction(title: "Профиль", handler: { _ in
            self.transitionToProfile()
        }),
        UIAction(title: "Заказы", handler: { _ in
            self.transitionToOrders()
        }),
    ]
    lazy var navigationMenu: UIMenu = {
        let menu = UIMenu(children: menuItems)
        return menu
    }()

    private lazy var menuButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.menu = navigationMenu
        btn.showsMenuAsPrimaryAction = true
        btn.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(menuButton)
    }
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            menuButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            menuButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
        ])
        
    }
}

extension BaseMainView {
    func transitionToOrders() {
        baseDelegate?.transitionToOrders()
    }
    
    func transitionToProfile() {
        baseDelegate?.transitionToProfile()
    }
}
