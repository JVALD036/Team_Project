//
//  ContentView.swift
//  Final
//
//  Created by Jonathan Valdez on 4/26/23.
//

import SwiftUI
import SwiftUIFontIcon
import SwiftUICharts

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @State var totalExpenses: Double = 0
    
    //Chart Data
    @State var demoData:[Double] = [0,1,2,3,4,5]
    

    var body: some View {
        
        NavigationView {
            List {
                Text("Overview")
                    .font(.title2)
                    .bold()
                CardView {
                    var totalExpenses: Double {
                        expenses.items.map { $0.amount }.reduce(0, +)
                    }
                
                    
                    ChartLabel(String(totalExpenses), type:.title)
                    PieChart()
                    
                }
                .data(demoData)
                .chartStyle(ChartStyle(backgroundColor: .white,
                                       foregroundColor: ColorGradient(.blue, .purple)))
                        .frame(height: 300)
                
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
                    demoData.append(totalExpenses)
                    
                    
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
    func totalAmount(for expenseItem: [ExpenseItem]) -> Double {
        expenseItem.map { $0.amount }.reduce(0, +)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
