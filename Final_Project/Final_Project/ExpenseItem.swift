//
//  ExpenseItem.swift
//  Final
//
//  Created by Jonathan Valdez on 4/26/23.
//

import Foundation
import SwiftUIFontIcon

struct ExpenseItem: Identifiable, Codable {
    var id = UUID() //makes id for each item
    let name: String //name of transaction
    let type: String
    let amount: Double // cost
    
    
    var categoryId: String // reference the Icon needed
    var icon:FontAwesomeCode {
        if let category = Category.all.first(where: { $0.name == type}) {
            return category.icon
        }
        //incase icon needs to be assigned
        return .question
    }
}


struct Category {
    let id:Int //future use
    let name: String //reference name in category pool
    let icon: FontAwesomeCode
    var mainCategoryId: Int? // future use
}

extension Category{
    //main category
    static let autoAndTransport = Category(id:1, name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id:2, name: "Bills And Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id:3, name: "Entertainment", icon: .film)
    static let feesAndCharges = Category(id:4, name: "Fees & Charges", icon: .hand_holding_usd)
    static let foodAndDining = Category(id:5, name: "Food & Dining", icon: .pizza_slice)
    static let home = Category(id:6, name: "Home", icon: .home)
    static let income = Category(id:7, name: "Income", icon: .dollar_sign)
    static let shopping = Category(id:8, name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt)
    
    //sub category - example usage
    static let publicTransportation = Category(id: 101, name: "Public Transport", icon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1)
}

//seperated main and sub categories for future use
extension Category{
    static let mainCategories: [Category] = [
        .autoAndTransport]
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi]
    // combine both of them
    static let all:[Category] = mainCategories + subCategories
}
