//
//  Wines.swift
//  Transactions
//
//  Created by Adrian Cardona on 4/23/23.
//

import Foundation
import Charts

struct Wine {
    enum Category: String {
        case variety, winery
    }
    var category: Category
    var value: Double
    var label: String
    
    static func entriesForWines(_ wines: [Wine], category: Category) -> [PieChartDataEntry] {
        let requestedWines = wines.filter {$0.category == category}
        return requestedWines.map { PieChartDataEntry(value: $0.value, label: $0.label)}
    }
    
    static var allWines:[Wine] {
        [
            Wine(category: .variety, value: 6, label: "Chardonnayd"),
            Wine(category: .variety, value: 2, label: "Merlot"),
            Wine(category: .variety, value: 5, label: "Pinot Gris"),
            Wine(category: .variety, value: 7, label: "Gewurtztraminer"),
            Wine(category: .variety, value: 12, label: "Red Blend"),
            Wine(category: .variety, value: 10, label: "White Blend"),
            Wine(category: .variety, value: 3, label: "Sauvingnon Blanc"),
            Wine(category: .variety, value: 6, label: "Cabernet Franc"),
            Wine(category: .variety, value: 5, label: "Sumac Ridge"),
            Wine(category: .variety, value: 8, label: "Missino Hill"),
            Wine(category: .variety, value: 5, label: "50th Parallel"),
            Wine(category: .variety, value: 6, label: "Quails Gate"),
            Wine(category: .variety, value: 3, label: "Tumbler Ridge"),
            Wine(category: .variety, value: 12, label: "Moraine"),
            Wine(category: .variety, value: 18, label: "Tantalus")
        ]
    }
}
