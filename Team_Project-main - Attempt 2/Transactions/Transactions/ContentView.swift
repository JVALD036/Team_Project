//
//  ContentView.swift
//  Transactions
//
//  Created by Jonathan Valdez and Adrian Cardona on 4/5/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    //Chart stuff
    @State private var pieChartEntries: [PieChartDataEntry] = []
    @State private var category: Wine.Category = .variety
    
    @StateObject var transactions = Transactions()
    @State private var showingAddTransaction = false
    
    var body: some View {
        VStack {
            //Insert pie chart here above the list of payments
            PieChart(entries: Wine.entriesForWines(Wine.allWines, category: category), category: $category)
                .frame(height: 400)
            Picker(selection: $category, label: Text("Category")) {
                Text("Variety").tag(Wine.Category.variety)
                Text("Winery").tag(Wine.Category.winery)
            }
            .pickerStyle(SegmentedPickerStyle())
            
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
