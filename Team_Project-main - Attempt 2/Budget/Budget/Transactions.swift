//
//  Transaction.swift
//  Budget
//
//  Created by Jonathan Valdez on 3/29/23.
//
//  Sources
//  https://medium.com/@balzsorbn/swiftui-make-text-multiline-inside-embed-hstack-and-vstack-with-image-6db76c2c24cc
// Aligment issues https://stackoverflow.com/questions/56443535/swiftui-text-alignment

import Foundation
import SwiftUI
import SwiftUIFontIcon

struct Transactions : View {
    var transaction: Transaction
    var body: some View {
        HStack(spacing: 20) {
            //  Icon
            //  Sources
            //  Install SwiftUIFontIcon https://iosexample.com/swiftuifonticon-the-easiest-way-to-implement-font-icons-in-your-swiftui-project/
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width:44, height:44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: Color.icon)
                }
            VStack(alignment: .leading, spacing: 6) {
                //  Merchant Name
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                //  Category
                Text(transaction.catagory)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                //  Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
                // Amount
                Text(transaction.signedAmount, format: .currency(code: "USD"))
                    .bold()
                    .foregroundColor(transaction.type == TransactionType.credit.rawValue ?
                                     Color.text: .primary)
            
        }
        .padding([.top, .bottom])
    }
}

struct TransactionPreview: PreviewProvider {
    static var previews: some View {
            Transactions(transaction: transactionDataPreview)
    }
}
