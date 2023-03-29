//
//  DataPreview.swift
//  Budget
//
//  Created by Jonathan Valdez on 3/29/23.
//
//  Sources
//  Data preview usage      https://useyourloaf.com/blog/swiftui-preview-data/


import Foundation
import SwiftUI

var transactionDataPreview = Transaction(id: 1, date: "03/29/2023", institution: "Wells Fargo", account: "Checkings", merchant: "Texas A&M -San Antonio", amount: 4000.00, type: "debit", categoryid: 001, catagory: "Software", isPending: false, isTransfer: false, isExpense: false, isEdited: false)
var transactionListPreviewData = [Transaction](repeating: transactionDataPreview, count:10)
