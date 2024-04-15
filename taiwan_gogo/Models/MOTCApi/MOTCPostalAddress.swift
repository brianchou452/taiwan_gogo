// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mOTCPostalAddress = try? newJSONDecoder().decode(MOTCPostalAddress.self, from: jsonData)

import Foundation

// MARK: - MOTCPostalAddress
struct MOTCPostalAddress: Codable {
    let city: String?
    let cityCode: String?
    let town: String?
    let townCode: String?
    let zipCode: String?
    let streetAddress: String?

    enum CodingKeys: String, CodingKey {
        case city = "City"
        case cityCode = "CityCode"
        case town = "Town"
        case townCode = "TownCode"
        case zipCode = "ZipCode"
        case streetAddress = "StreetAddress"
    }
}
