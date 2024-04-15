//
//  UserPOI.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/15.
//

import Foundation
import SwiftData

@Model
class UserPOI {
    var name: String
    var visitDuration: TimeInterval
    var dayOfTrip: Int
    var priority: Int
    var details: PointOfInterest

    init(name: String, visitDuration: TimeInterval, dayOfTrip: Int, priority: Int, details: PointOfInterest) {
        self.name = name
        self.visitDuration = visitDuration
        self.dayOfTrip = dayOfTrip
        self.priority = priority
        self.details = details
    }
}
