//
//  Transactions.swift
//  Budget
//
//  Created by Jonathan Valdez on 3/29/23.
//
//  Sources
// https://www.hackingwithswift.com/read/0/15/structs
// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures/

import Foundation
import SwiftUI

struct Transaction: Identifiable{
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    let categoryid: Int
    let catagory: String
    let isPending: Bool
    let isTransfer: Bool
    let isExpense: Bool
    let isEdited: Bool
    
    var dateParsed: Date {
        date.dateFormatter()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
}
enum TransactionType: String {
    case debit = "debit"
    case credit  = "credit"
}
