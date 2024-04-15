// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mOTCEventResponse = try? newJSONDecoder().decode(MOTCEventResponse.self, from: jsonData)

import Foundation

// MARK: - MOTCEventResponse
struct MOTCEventResponse: Codable {
    let updateTime: Date?
    let updateInterval: Int?
    let language, providerID: String?
    let events: [MOTCEvent]?

    enum CodingKeys: String, CodingKey {
        case updateTime = "UpdateTime"
        case updateInterval = "UpdateInterval"
        case language = "Language"
        case providerID = "ProviderID"
        case events = "Events"
    }
}
