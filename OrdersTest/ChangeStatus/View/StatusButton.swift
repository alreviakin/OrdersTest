//
//  StatusButton.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 03.12.2023.
//

import UIKit

class StatusButton: UIButton {

    convenience init(title: String) {
        self.init()
        setTitle(title, for: .normal)
        backgroundColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            titleLabel!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }

}
