//
//  Expenses.swift
//  Final
//
//  Created by Jonathan Valdez on 4/26/23.
//

import Foundation

// class that makes the array from ExpenseItem Struct
class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey:"Items")
            }
        }
    }
    // Computed property that calculates the total amount
    //Source https://stackoverflow.com/questions/62354836/swiftui-how-do-i-access-manipulate-data-between-views
    var total: Double {
        self.items.reduce(0) { result, item -> Double in
            result + item.amount
        }
    }
            
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            //refering to the array of expense item as a type of it self -> .self
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self , from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
