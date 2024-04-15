// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mOTCAttraction = try? newJSONDecoder().decode(MOTCAttraction.self, from: jsonData)

import Foundation

// MARK: - MOTCAttraction
struct MOTCAttraction: Codable {
    let attractionID: String?
    let attractionName: String?
    let alternateNames: [String]?
    let sightsDescription: String?
    let positionLat: Double?
    let positionLon: Double?
    let geometry: String?  /// 描述面形空間資料，以字串儲存面形、多重面形，資料型態為 WKT 格式之 Polygon 或 Multi Polygon。
    let attractionClasses: [Int]?
    let postalAddress: MOTCPostalAddress?
    let telephones: [MOTCTelephone]?
    let images: [MOTCImage]?
    let organizations: [MOTCOrganization]?
    let serviceTimeInfo: String?
    let trafficInfo: String?
    let parkingInfo: String?
    let facilities: [String]?
    let serviceStatus: Int?
    let isPublicAccess: Int?
    let isAccessibleForFree: Int?
    let feeInfo: String?
    let paymentMethods: [String]?
    let locatedCities: [MOTCLocatedCity]?
    let websiteURL: String?
    let reservationURLs: [String]?
    let mapURLs: [String]?
    let sameAsURLs: [String]?
    let socialMediaURLs: [MOTCSocialMediaURL]?
    let visitDuration: Int?
    let assetsClass: Int?
    let subAttractions: [String]?
    let partOfAttraction: String? /// 描述景點屬於子景點時，填寫其歸屬之主景點/景區資訊
    let remarks: String?
    let updateTime: Date?

    enum CodingKeys: String, CodingKey {
        case attractionID = "AttractionID"
        case attractionName = "AttractionName"
        case alternateNames = "AlternateNames"
        case sightsDescription = "Description"
        case positionLat = "PositionLat"
        case positionLon = "PositionLon"
        case geometry = "Geometry"
        case attractionClasses = "AttractionClasses"
        case postalAddress = "PostalAddress"
        case telephones = "Telephones"
        case images = "Images"
        case organizations = "Organizations"
        case serviceTimeInfo = "ServiceTimeInfo"
        case trafficInfo = "TrafficInfo"
        case parkingInfo = "ParkingInfo"
        case facilities = "Facilities"
        case serviceStatus = "ServiceStatus"
        case isPublicAccess = "IsPublicAccess"
        case isAccessibleForFree = "IsAccessibleForFree"
        case feeInfo = "FeeInfo"
        case paymentMethods = "PaymentMethods"
        case locatedCities = "LocatedCities"
        case websiteURL = "WebsiteURL"
        case reservationURLs = "ReservationURLs"
        case mapURLs = "MapURLs"
        case sameAsURLs = "SameAsURLs"
        case socialMediaURLs = "SocialMediaURLs"
        case visitDuration = "VisitDuration"
        case assetsClass = "AssetsClass"
        case subAttractions = "SubAttractions"
        case partOfAttraction = "PartOfAttraction"
        case remarks = "Remarks"
        case updateTime = "UpdateTime"
    }
}
