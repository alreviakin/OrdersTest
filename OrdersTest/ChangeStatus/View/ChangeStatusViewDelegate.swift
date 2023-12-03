//
//  ChangeStatusViewControllerDelegate.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 04.12.2023.
//

import Foundation

protocol ChangeStatusViewDelegate: AnyObject {
    func changeStatus(status: String)
    func cancel()
}
