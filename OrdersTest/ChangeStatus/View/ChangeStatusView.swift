//
//  ChangeStatusView.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 03.12.2023.
//

import UIKit

class ChangeStatusView: UIView {
    
    weak var delegate: ChangeStatusViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Статус"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    private lazy var inProgressButton = StatusButton(title: "inProgress")
    private lazy var cancelledButton = StatusButton(title: "cancelled")
    private lazy var completedButton = StatusButton(title: "completed")
    private lazy var finishedButton = StatusButton(title: "finished")
    private var errorLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Error"
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    private lazy var cancelButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 122/255, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return button
    }()
    convenience init(status: String) {
        self.init()
        configure()
        
        let statusCase = Status(rawValue: status)
        switch statusCase {
        case .new:
            completedButton.backgroundColor = .gray
            completedButton.isEnabled = false
            finishedButton.backgroundColor = .gray
            finishedButton.isEnabled = false
        case .inProgress:
            inProgressButton.backgroundColor = .gray
            inProgressButton.isEnabled = false
            finishedButton.backgroundColor = .gray
            finishedButton.isEnabled = false
        case .cancelled:
            return
        case .completed:
            completedButton.backgroundColor = .gray
            completedButton.isEnabled = false
            inProgressButton.backgroundColor = .gray
            inProgressButton.isEnabled = false
            cancelledButton.backgroundColor = .gray
            cancelledButton.isEnabled = false
        case .finished:
            return
        case .none:
            return
        }
        
    }
    
    private func configure() {
        backgroundColor = .white
        addSubview(inProgressButton)
        addSubview(cancelledButton)
        addSubview(completedButton)
        addSubview(finishedButton)
        addSubview(titleLabel)
        addSubview(errorLabel)
        addSubview(cancelButton)
        
        inProgressButton.addTarget(self, action: #selector(changeStatus), for: .touchUpInside)
        cancelledButton.addTarget(self, action: #selector(changeStatus), for: .touchUpInside)
        completedButton.addTarget(self, action: #selector(changeStatus), for: .touchUpInside)
        finishedButton.addTarget(self, action: #selector(changeStatus), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cancelButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            inProgressButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            inProgressButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),

            cancelledButton.topAnchor.constraint(equalTo: inProgressButton.bottomAnchor, constant: 20),
            cancelledButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),

            completedButton.topAnchor.constraint(equalTo: cancelledButton.bottomAnchor, constant: 20),
            completedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),

            finishedButton.topAnchor.constraint(equalTo: completedButton.bottomAnchor, constant: 20),
            finishedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            errorLabel.topAnchor.constraint(equalTo: finishedButton.bottomAnchor, constant: 20),
            errorLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

extension ChangeStatusView {
    @objc
    func changeStatus(sender: UIButton) {
        let status = sender.titleLabel!.text!
        delegate?.changeStatus(status: status)
    }
    
    @objc
    func cancel() {
        delegate?.cancel()
    }
    
    func showError() {
        errorLabel.isHidden = false
        errorLabel.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.errorLabel.alpha = 1
        }
    }
}
