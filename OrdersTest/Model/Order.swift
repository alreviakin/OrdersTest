//
//  Order.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 03.12.2023.
//

import Foundation

struct Order: Codable {
    let id: String
    let name: String
    let description: String
    let status: String
    var coast: String?
    var comment: String?
    var position: Position?
}

struct Position: Codable {
    let latitude: Float
    let longitude: Float
}
