//
//  Transactions.swift
//  Transactions
//
//  Created by Jonathan Valdez and Adrian Cardona on 4/5/23.
//

import Foundation
class Transactions: ObservableObject {
    @Published var items = [TransactionItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([TransactionItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
