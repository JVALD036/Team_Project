//
//  Expenses.swift
//  TeamProjAttempt3
//
//  Created by ItsaMe on 5/3/23.
//

import Foundation

// class that makes the array from ExpenseItem Struct
class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    //attempt to save array data for line chart
    @Published var amountValues = [Double]() {
        didSet {
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(amountValues) {
                UserDefaults.standard.set(encoded, forKey: "Values")
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
        
        //custom testing data
        if let savedValues = UserDefaults.standard.data(forKey: "Values") {
            if let decodedValues = try? JSONDecoder().decode([Double].self, from: savedValues) {
                amountValues = decodedValues
                return
            }
        }
        amountValues = []
    }
}
