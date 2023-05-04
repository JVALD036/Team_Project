//
//  ExpenseItem.swift
//  TeamProjAttempt3
//
//  Created by ItsaMe on 5/3/23.
//

import Foundation
import SwiftUIFontIcon

struct ExpenseItem: Identifiable, Codable {
    var id = UUID() //makes id for each item
    let name: String //name of transaction
    let type: String
    let amount: Double // cost
    let date: Date
    let notes: String
    
    
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
    static let education = Category(id:1, name: "Education", icon: .school)
    static let entertainment = Category(id:2, name: "Entertainment", icon: .gamepad)
    static let food = Category(id:3, name: "Food", icon: .hamburger)
    static let gas = Category(id:4, name: "Gasoline", icon: .gas_pump )
    static let groceries = Category(id:5, name: "Groceries", icon: .store)
    static let loan = Category(id:10, name: "Loan", icon: .money_bill)
    static let medical = Category(id:6, name: "Medical", icon: .clinic_medical)
    static let miscellaneous = Category(id:7, name: "Miscellaneous", icon: .random)
    static let home = Category(id:8, name: "Rent", icon: .house_user)
    static let subscription = Category(id: 9, name: "Subscription", icon: .itunes_note)
    static let travel = Category(id:8, name: "Travel", icon: .plane)
    static let utilities = Category(id: 9, name: "Utilities", icon: .lightbulb)
    
    
    //sub category - example usage
    static let publicTransportation = Category(id: 101, name: "Public Transport", icon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1)
}

//seperated main and sub categories for future use
extension Category{
    static let mainCategories: [Category] = [
        .education,
        .entertainment,
        .food,
        .gas,
        .groceries,
        .loan,
        .medical,
        .miscellaneous,
        .home,
        .subscription,
        .travel,utilities]
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi]
    // combine both of them
    static let all:[Category] = mainCategories + subCategories
}
