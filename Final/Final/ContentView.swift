//
//  ContentView.swift
//  Final
//
//  Created by Jonathan Valdez on 4/26/23.
//

import SwiftUI
import SwiftUIFontIcon

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    //Chart Data
    var demoData:[Double] = [8,2,4,6,12,9,2]
    
    var body: some View {
        NavigationView {
            List {
                //identify each item by its name
                ForEach(expenses.items) { item in
                    HStack(spacing:20) {
                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                            .fill(Color.blue.opacity(0.3))
                            .frame(width: 44, height: 44)
                            .overlay{
                                FontIcon.text(.awesome5Solid(code: item.icon), fontsize: 24)
                            }
                        
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
