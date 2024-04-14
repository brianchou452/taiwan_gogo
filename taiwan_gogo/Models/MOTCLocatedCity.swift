// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mOTCLocatedCity = try? newJSONDecoder().decode(MOTCLocatedCity.self, from: jsonData)

import Foundation

// MARK: - MOTCLocatedCity
struct MOTCLocatedCity: Codable {
    let name: String?
    let locatedCityClass: Int?
    let city: String?
    let cityCode: String?
    let town: String?
    let townCode: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case locatedCityClass = "Class"
        case city = "City"
        case cityCode = "CityCode"
        case town = "Town"
        case townCode = "TownCode"
    }
}
