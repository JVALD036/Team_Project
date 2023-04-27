//
//  ColorModifiers.swift
//  Budget
//
//  Created by Jonathan Valdez on 3/29/23.

//  Sources
//  Original Solution to add custom colors https://www.seemuapps.com/swift-custom-uicolor-extension-add-custom-colors
//  Currently used solution to add custom colors using Assets https://stackoverflow.com/questions/44397680/how-can-we-use-assets-catalog-color-sets
import Foundation
import SwiftUI
extension Color{
    static let background = Color("BackgroundColors")
    static let icon = Color("IconColors")
    static let text = Color("TextColors")
    static let systemBackground = Color(uiColor: .systemBackground)
    
}
