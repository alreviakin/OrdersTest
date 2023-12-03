//
//  OrderCellDelegate.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 03.12.2023.
//

import Foundation

protocol OrderCellDelegate: AnyObject {
    func changeStatus(tag: Int)
}
