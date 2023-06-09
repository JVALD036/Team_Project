//
//  AddView.swift
//  Final
//
//  Created by Jonathan Valdez on 4/26/23.
//

import SwiftUI

struct AddView: View {
    //passed from content view
    @ObservedObject var expenses:Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Miscellaneous"
    @State private var amount = 0.0
    @State private var date = Date.now
    @State private var notes = ""
    
    
    let types = ["Education", "Entertainment", "Food", "Gas", "Groceries", "Loan", "Medical", "Miscellaneous", "Rent", "Subscription", "Travel","Utilities"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                TextField("Amount", value:$amount, format :.currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
                
                Picker("Type", selection: $type) {
                    ForEach(types, id:\.self) {
                        Text($0)
                    }
                }
                DatePicker("Enter Date", selection: $date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .frame(maxHeight: 220)
                
                TextField("Notes", text:$notes)
            }
                
            .navigationTitle("Add new expense")
            .toolbar{
                Button("Save"){
                    //fix category ID
                    let item = ExpenseItem(name: name, type: type, amount: amount, date: date, notes: notes, categoryId: "idk")
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}
///view is user generated
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
