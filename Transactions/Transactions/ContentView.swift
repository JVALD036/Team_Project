//
//  ContentView.swift
//  Transactions
//
//  Created by Jonathan Valdez on 4/5/23.
//

import SwiftUI
import SwiftUIFontIcon


struct ContentView: View {
    @StateObject var transactions = Transactions()
    @State private var showingAddTransaction = false
    
    var body: some View {
        NavigationView{
            List {
                //Every item unique by its name --> causing issues
                ForEach(transactions.items) { item in
                    HStack(spacing: 20) {
                        //  Icon
                        //  Sources
                        //  Install SwiftUIFontIcon https://iosexample.com/swiftuifonticon-the-easiest-way-to-implement-font-icons-in-your-swiftui-project/
                        // File -> add packages https://github.com/mattmaddux/FASwiftUI.git
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.icon.opacity(0.3))
                            .frame(width:66, height:44)
                            .overlay {
                                FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: Color.icon)
                            }
                        VStack(alignment: .leading, spacing: 6) {
                            //  Merchant Name
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
                        }
                        Spacer()
                        // Amount
                        Text(item.amount, format: .currency(code: "USD"))
                            .bold()
                    }
                    
                    .padding([.top, .bottom])
                }
                .onDelete(perform: removeItems)

            }
            .navigationTitle("Expense Tracker")
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
