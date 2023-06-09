//
//  AddView.swift
//  Transactions
//
//  Created by Jonathan Valdez on 4/5/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var transactions: Transactions
    
    @State private var name = ""
    @State private var type = "Miscellaneous"
    @State private var amount = 0.0
    @State private var date = Date.now
    @State private var notes = ""
    
    let types = ["Education", "Entetainment", "Food", "Gas", "Groceries", "Loan", "Medical", "Miscellaneous", "Rent", "Subscription", "Travel","Utilities"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text:$name)
                
                TextField("Amount", value:$amount,format: .currency(code:"USD"))

                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)}
            
                }
                DatePicker("Enter Date", selection: $date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .frame(maxHeight: 220)
                
                TextField("Notes", text:$notes)
            }
            .navigationTitle("Add Transaction")
            .toolbar {
                Button("Save") {
                    let item = TransactionItem(name: name, type: type, amount: amount, date:date,notes: notes )
                    transactions.items.append(item)
                }
            }
        }
    }
}

    
    struct AddView_Previews: PreviewProvider {
        static var previews: some View {
            AddView(transactions: Transactions())
        }
    }
