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
