// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mOTCAttractionResponse = try? newJSONDecoder().decode(MOTCAttractionResponse.self, from: jsonData)

import Foundation

// MARK: - MOTCAttractionResponse
struct MOTCAttractionResponse: Codable {
    let updateTime: Date?
    let updateInterval: Int?
    let language: String?
    let providerID: String?
    let attractions: [MOTCAttraction]?

    enum CodingKeys: String, CodingKey {
        case updateTime = "UpdateTime"
        case updateInterval = "UpdateInterval"
        case language = "Language"
        case providerID = "ProviderID"
        case attractions = "Attractions"
    }
}
