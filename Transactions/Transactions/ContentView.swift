//
//  ContentView.swift
//  Transactions
//
//  Created by Jonathan Valdez on 4/5/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var transactions = Transactions()
    @State private var showingAddTransaction = false
    
    var body: some View {
        NavigationView{
            List {
                //Every item unique by its name --> causes issues
                ForEach(transactions.items) {
                    item in Text(item.name)
                }
                
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Budget")
            .toolbar {
                Button {
                    showingAddTransaction = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddTransaction){
                AddView(transactions: transactions)
                
            }
            
        }
    }
    func removeItems(at offsets: IndexSet) {
        transactions.items.remove(atOffsets: offsets)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
