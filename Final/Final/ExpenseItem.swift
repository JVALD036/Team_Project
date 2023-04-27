//
//  ExpenseItem.swift
//  Final
//
//  Created by Jonathan Valdez on 4/26/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID() //makes id for each item
    let name: String
    let type: String
    let amount: Double
}
