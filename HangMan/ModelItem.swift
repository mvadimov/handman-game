//
//  ModelItem.swift
//  HangMan
//
//  Created by Mark Vadimov on 24.06.24.
//

import Foundation
import SwiftData

struct Words: Identifiable {
    let id: Int
    let word: String
    let prompt: String
    let isUsed: Bool
}

struct Topic: Identifiable {
    let id: Int
    let words: [Words]
}

@Model
final class Item {
    var timestamp: Date
    var name: String
    var points: Int
    
    init(timestamp: Date, name: String = "", points: Int = 0) {
        self.timestamp = timestamp
        self.name = name
        self.points = points
    }
}
