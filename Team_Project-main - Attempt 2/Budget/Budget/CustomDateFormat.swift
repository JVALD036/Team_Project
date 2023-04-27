//
//  CustomDateFormat.swift
//  Budget
//
//  Created by Jonathan Valdez on 3/29/23.
//
//  Sources
//  using a date extension and string extension to format date https://www.hackingwithswift.com/forums/swift/swift-5-dateformatter-convert-string-to-date-with-extension/11455
//  fix issues with our version, simple solution https://stackoverflow.com/questions/55318163/include-a-date-converter-function-inside-of-a-dateformatter-extension
//  Fix function dataFormatter with guard https://www.avanderlee.com/swift/guard-statements/#:~:text=Guard%20statements%20in%20Swift%20allow,field%20before%20submitting%20a%20form.

import Foundation
import SwiftUI

extension DateFormatter {
    static let text: DateFormatter = {
        print ("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    } ()
}

extension String {
    func dateFormatter() -> Date {
        //reference self not string
        guard let parsedDate = DateFormatter.text.date(from:self)
        else {return Date()}
        
        return parsedDate
        
        
    }
}
