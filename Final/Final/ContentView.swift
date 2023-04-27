//
//  ContentView.swift
//  Final
//
//  Created by Jonathan Valdez on 4/26/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                //identify each item by its name
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Budget Tracker")
            .toolbar{
                Button{
                    showingAddExpense = true
                }label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingAddExpense){
                    AddView(expenses: expenses)
                }
            }
        }
    }
    func removeItems(at offsets:IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
