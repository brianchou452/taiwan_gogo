// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mOTCEvent = try? newJSONDecoder().decode(MOTCEvent.self, from: jsonData)

import Foundation

// MARK: - MOTCEvent
struct MOTCEvent: Codable {
    let eventID, eventName: String?
    let alternateNames: [String]?
    let eventDescription: String?
    let positionLat, positionLon: Double?
    let geometry: String?
    let eventClasses: [Int]?
    let postalAddress: MOTCPostalAddress?
    let telephones: [MOTCTelephone]?
    let images: [MOTCImage]?
    let organizations: [MOTCOrganization]?
    let trafficInfo, parkingInfo: String?
    let facilities: [String]?
    let isAccessibleForFree: Int?
    let feeInfo: String?
    let paymentMethods: [String]?
    let locatedCities: [MOTCLocatedCity]?
    let websiteURL: String?
    let reservationURLs: [String]?
    let mapURLs: [String]?
    let sameAsURLs, socialMediaURLs: [String]?
    let participant: String?
    let startDateTime, endDateTime: Date?
    let eventStatus: String?
    let previousStartDates: [Date]? /// 先前排定之活動起始日期
    let calendarURLs, subEvents: [String]?
    let superEvent: String? /// (屬於…)主活動
    let remarks: String?
    let updateTime: Date?

    enum CodingKeys: String, CodingKey {
        case eventID = "EventID"
        case eventName = "EventName"
        case alternateNames = "AlternateNames"
        case eventDescription = "Description"
        case positionLat = "PositionLat"
        case positionLon = "PositionLon"
        case geometry = "Geometry"
        case eventClasses = "EventClasses"
        case postalAddress = "PostalAddress"
        case telephones = "Telephones"
        case images = "Images"
        case organizations = "Organizations"
        case trafficInfo = "TrafficInfo"
        case parkingInfo = "ParkingInfo"
        case facilities = "Facilities"
        case isAccessibleForFree = "IsAccessibleForFree"
        case feeInfo = "FeeInfo"
        case paymentMethods = "PaymentMethods"
        case locatedCities = "LocatedCities"
        case websiteURL = "WebsiteURL"
        case reservationURLs = "ReservationURLs"
        case mapURLs = "MapURLs"
        case sameAsURLs = "SameAsURLs"
        case socialMediaURLs = "SocialMediaURLs"
        case participant = "Participant"
        case startDateTime = "StartDateTime"
        case endDateTime = "EndDateTime"
        case eventStatus = "EventStatus"
        case previousStartDates = "PreviousStartDates"
        case calendarURLs = "CalendarURLs"
        case subEvents = "SubEvents"
        case superEvent = "SuperEvent"
        case remarks = "Remarks"
        case updateTime = "UpdateTime"
    }
}
