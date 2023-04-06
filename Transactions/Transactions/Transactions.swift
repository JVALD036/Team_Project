//
//  Transactions.swift
//  Transactions
//
//  Created by Jonathan Valdez on 4/5/23.
//

import Foundation
class Transactions: ObservableObject {
    @Published var items = [TransactionItem]()
}
