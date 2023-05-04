//
//  ValueTracker.swift
//  TeamProjAttempt3
//
//  Created by ItsaMe on 5/3/23.
//

import Foundation

struct ValueTracker: Codable, Identifiable {
    var id = UUID()
    var values: [Double]
}
