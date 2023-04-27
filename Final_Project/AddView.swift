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
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal", "Auto & Transport", "Public Transport"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id:\.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value:$amount, format :.currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar{
                Button("Save"){
                    let item = ExpenseItem(name: name, type:type, amount:amount, categoryId: "Auto & Transport")
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
