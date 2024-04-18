//
//  PointOfInterest.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/15.
//

import Foundation
import SwiftData

@Model
class PointOfInterest {
    let type: POIType
    let name: String
    let positionLat: Double
    let positionLon: Double
    let images: [String]
    let poiDescription: String
    let updateTime: Date
    let trafficInfo: String?
    let telephones: String?

    // Event Only
    let startDateTime: Date?
    let endDateTime: Date?

    init(type: POIType, name: String, positionLat: Double, positionLon: Double, images: [String], poiDescription: String, updateTime: Date, trafficInfo: String?, telephones: String?, startDateTime: Date?, endDateTime: Date?) {
        self.type = type
        self.name = name
        self.positionLat = positionLat
        self.positionLon = positionLon
        self.images = images
        self.poiDescription = poiDescription
        self.updateTime = updateTime
        self.trafficInfo = trafficInfo
        self.telephones = telephones
        self.startDateTime = startDateTime
        self.endDateTime = endDateTime
    }

    init(attraction: MOTCAttraction) {
        self.type = .attraction
        self.name = attraction.attractionName ?? ""
        self.positionLat = attraction.positionLat ?? 0
        self.positionLon = attraction.positionLon ?? 0
        self.images = attraction.images?.map { image -> String in image.url ?? "" } ?? []
        self.poiDescription = attraction.sightsDescription ?? ""
        self.updateTime = attraction.updateTime ?? .now
        self.trafficInfo = attraction.trafficInfo
        self.telephones = attraction.telephones?.first?.tel
    }

    init(event: MOTCEvent) {
        self.type = .event
        self.name = event.eventName ?? ""
        self.positionLat = event.positionLat ?? 0
        self.positionLon = event.positionLon ?? 0
        self.images = event.images?.map { image -> String in image.url ?? "" } ?? []
        self.poiDescription = event.eventDescription ?? ""
        self.updateTime = event.updateTime ?? .now
        self.trafficInfo = event.trafficInfo
        self.telephones = event.telephones?.first?.tel
        self.startDateTime = event.startDateTime
        self.endDateTime = event.endDateTime
    }
}

enum POIType: String, Codable {
    case attraction
    case event
}
