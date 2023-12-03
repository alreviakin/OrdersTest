//
//  OrderTableViewCell.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 02.12.2023.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    weak var delegate: OrderCellDelegate?
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.text = "Название - 123(id)"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private var statusLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.text = "Статус - новый"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    private lazy var changeStatusButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Изменить", for: .normal)
        btn.setTitleColor(UIColor(red: 0, green: 122/255, blue: 1, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(changeStatus), for: .touchUpInside)
        return btn
    }()
    private var descriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.text = "Описание - данный товар заказывали уже дважды"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private var coastLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.text = "Цена - 125"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private var commentLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.text = "Комментарий - заказ был доставлен в срок"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    func configureCell(order: Order) {
        if order.status == "finished" || order.status == "cancelled" {
            changeStatusButton.isHidden = true
        }
        titleLabel.text = order.name + " - " + order.id
        statusLabel.text = "Статус - " + order.status
        descriptionLabel.text = "Описание - " + order.description
        coastLabel.text = "Цена - " + (order.coast ?? "nil")
        commentLabel.text = "Комментарий - " + (order.comment ?? "nil")
    }
    
    private func configure() {
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(changeStatusButton)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(coastLabel)
        contentView.addSubview(commentLabel)

        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            statusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            statusLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            changeStatusButton.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor),
            changeStatusButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            coastLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            coastLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            coastLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            commentLabel.topAnchor.constraint(equalTo: coastLabel.bottomAnchor, constant: 5),
            commentLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            commentLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
        statusLabel.text = nil
        descriptionLabel.text = nil
        coastLabel.text = nil
        commentLabel.text = nil
    }
}

extension OrderTableViewCell {
    @objc
    func changeStatus() {
        delegate?.changeStatus(tag: self.tag)
    }
}
