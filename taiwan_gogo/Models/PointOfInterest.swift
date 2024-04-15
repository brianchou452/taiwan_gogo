//
//  PointOfInterest.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/15.
//

import Foundation

struct PointOfInterest: Codable, Identifiable {
    let id = UUID()

    let type: POIType
    let positionLat: Double
    let positionLon: Double
    let attraction: MOTCAttraction?
    let event: MOTCEvent?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case type = "Type"
        case positionLat = "PositionLat"
        case positionLon = "PositionLon"
        case attraction = "Attraction"
        case event = "Event"
    }

    init(type: POIType, positionLat: Double, positionLon: Double, attraction: MOTCAttraction? = nil, event: MOTCEvent? = nil) {
        self.type = type
        self.positionLat = positionLat
        self.positionLon = positionLon
        self.attraction = attraction
        self.event = event
    }

    func getImages() -> [MOTCImage] {
        if self.type == .attraction {
            return self.attraction?.images ?? []
        } else if self.type == .event {
            return self.event?.images ?? []
        } else {
            return []
        }
    }

    func getName() -> String {
        if self.type == .attraction {
            return self.attraction?.attractionName ?? ""
        } else if self.type == .event {
            return self.event?.eventName ?? ""
        } else {
            return ""
        }
    }
}

enum POIType: String, Codable {
    case attraction
    case event
}
