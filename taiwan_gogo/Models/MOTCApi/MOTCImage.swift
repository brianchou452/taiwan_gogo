// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mOTCImage = try? newJSONDecoder().decode(MOTCImage.self, from: jsonData)

import Foundation

// MARK: - MOTCImage
struct MOTCImage: Codable {
    let name: String?
    let imageDescription: String?
    let url: String?
    let width: Int?
    let height: Int?
    let keywords: [String]?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case imageDescription = "Description"
        case url = "URL"
        case width = "Width"
        case height = "Height"
        case keywords = "Keywords"
    }
}
