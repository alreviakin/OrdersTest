//
//  BaseControllerDelegate.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 02.12.2023.
//

import Foundation

protocol BaseControllerDelegaete: AnyObject {
    func transitionToOrders()
    func transitionToProfile()
}
