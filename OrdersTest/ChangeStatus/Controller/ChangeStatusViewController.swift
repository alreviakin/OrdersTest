//
//  ChangeStatusViewController.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 03.12.2023.
//

import UIKit

class ChangeStatusViewController: UIViewController {
    
    private var status: String = ""
    private var uid: String = ""
    private lazy var changeStatusView = ChangeStatusView(status: status)
    
    override func loadView() {
        super.loadView()
        self.view = changeStatusView
        changeStatusView.delegate = self
    }

    convenience init(status: String, uid: String) {
        self.init()
        self.status = status
        self.uid = uid
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
}

extension ChangeStatusViewController: ChangeStatusViewDelegate {
    func cancel() {
        dismiss(animated: true)
    }
    
    func changeStatus(status: String) {
        FirebaseManager.shared.setStatusOrder(status: status, uid: uid) {[weak self] error in
            guard let self else { return }
            if error != nil {
                self.changeStatusView.showError()
                return
            }
            
            let vc = TabBarViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }

}
