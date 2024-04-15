//
//  Tirp.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/14.
//

import Foundation
import SwiftData

@Model
class Trip {
    var name: String
    var details: String
    var date: Date
    var tripDays: Int
    @Relationship(deleteRule: .cascade) var attractions = [Attraction]()

    init(name: String = "", details: String = "", date: Date = .now, tripDays: Int = 1, attractions: [Attraction] = [Attraction]()) {
        self.name = name
        self.details = details
        self.date = date
        self.tripDays = tripDays
        self.attractions = attractions
    }
}
