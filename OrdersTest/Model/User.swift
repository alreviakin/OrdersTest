//
//  File.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 03.12.2023.
//

import Foundation

struct User {
    let firstname: String
    let secondName: String
    let countOrders: String
    
    var fullName: String {
        firstname + " " + secondName
    }
}
