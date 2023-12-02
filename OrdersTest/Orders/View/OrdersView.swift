//
//  OrdersView.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 02.12.2023.
//

import UIKit

class OrdersView: BaseMainView {
    
    weak var tableDelegate: OrdersTableViewDelegate?
    
    private let ordersTitleLable: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Заказы"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
        return label
    }()
    
    private lazy var tableView: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = tableDelegate
        table.delegate = tableDelegate
        table.estimatedRowHeight = 100
        table.rowHeight = UITableView.automaticDimension
        table.register(OrderTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ tableDelegate: OrdersTableViewDelegate) {
        self.init()
        self.tableDelegate = tableDelegate
        configure()
    }
    
    private func configure() {
        backgroundColor = .white
        
        addSubview(ordersTitleLable)
        addSubview(tableView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            ordersTitleLable.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            ordersTitleLable.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            tableView.topAnchor.constraint(equalTo: ordersTitleLable.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
    }

}
