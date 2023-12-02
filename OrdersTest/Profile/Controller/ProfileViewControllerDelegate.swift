//
//  ProfileViewControllerDelegate.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 01.12.2023.
//

import Foundation

protocol ProfileViewControllerDelegate: AnyObject {
    func transitionToProfile()
    func transitionToOrders()
}
