//
//  ContentView.swift
//  TeamProjAttempt3
//
//  Created by ItsaMe on 5/3/23.
//

import SwiftUI
import SwiftUIFontIcon
import SwiftUICharts

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var totalExpenses: Double = 0.0
    
    //Chart Data
    @State var demoData:[Double] = [0.0]

    var body: some View {
        
        NavigationView {
            List {
                Text("Overview")
                    .font(.title2)
                    .bold()
                
                CardView {
                    //old solution
//                    var totalExpenses: Double {
//                        expenses.items.map { $0.amount }.reduce(0, +)
//                    }
                
                    
                    ChartLabel(String("Statistics"),type: .subTitle)
                    LineChart()
                    
                    
                }
                //.data(demoData)
                .data(expenses.amountValues)
                .chartStyle(ChartStyle(backgroundColor: .white,
                                       foregroundColor: ColorGradient(.blue, .purple)))
                        .frame(height: 300)
                HStack {
                                   Text("Total:")
                                   Spacer()
                                   Text("\(expenses.total,specifier: "%.2f")")
                               }
                .bold()
                .padding(10)
                
               
                
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
                                .font(.subheadline)
                                .bold()
                                .lineLimit(1)
                            //  Category type
                            Text(item.type)
                                .font(.footnote)
                                .opacity(0.7)
                                .lineLimit(1)
                            //  Date
                            Text(item.date, format: .dateTime.year().month().day())
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                            //  Notes
                            Text(item.notes)
                                .font(.footnote)
                                .opacity(0.7)
                                .lineLimit(1)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                            .bold()
                    
                        
                       
                        
                    }
                }
                .onDelete(perform: removeItems)
                //keep for now
              
                
            }
            .navigationTitle("Budget Tracker")
            .toolbar{
                
                Button{
                    //demoData.append(expenses.total)
                    
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
    
    //Old solution
//    func totalAmount(for expenseItem: [ExpenseItem]) -> Double {
//        expenseItem.map { $0.amount }.reduce(0, +)
//
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
