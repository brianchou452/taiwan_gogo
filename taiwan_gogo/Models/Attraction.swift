//
//  Attraction.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/15.
//

import Foundation
import SwiftData

@Model
class Attraction {
    var name: String
    var visitDuration: TimeInterval
    var dayOfTrip: Int
    var priority: Int
    var motcAttractionID: String
    var alternateNames: [String]?
    var attractionDescription: String?
    var positionLat: Double
    var positionLon: Double

    init(name: String, visitDuration: TimeInterval, dayOfTrip: Int, priority: Int, motcAttractionID: String, alternateNames: [String]? = nil, attractionDescription: String? = nil, positionLat: Double, positionLon: Double) {
        self.name = name
        self.visitDuration = visitDuration
        self.dayOfTrip = dayOfTrip
        self.priority = priority
        self.motcAttractionID = motcAttractionID
        self.alternateNames = alternateNames
        self.attractionDescription = attractionDescription
        self.positionLat = positionLat
        self.positionLon = positionLon
    }
}
