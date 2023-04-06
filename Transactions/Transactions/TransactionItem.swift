//
//  TransactionItem.swift
//  Transactions
//
//  Created by Jonathan Valdez on 4/5/23.
//

import Foundation
struct TransactionItem : Identifiable {
    let id=UUID()
    let name: String
    let type: String
    let amount: Double
    let date: Date
    let notes: String
}
