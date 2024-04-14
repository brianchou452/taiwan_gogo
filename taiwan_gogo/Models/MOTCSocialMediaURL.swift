// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mOTCSocialMediaURL = try? newJSONDecoder().decode(MOTCSocialMediaURL.self, from: jsonData)

import Foundation

// MARK: - MOTCSocialMediaURL
struct MOTCSocialMediaURL: Codable {
    let name: String?
    let description: String?
    let url: String?
    let keywords: [JSONAny]?
    let tags: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case description = "Description"
        case url = "URL"
        case keywords = "Keywords"
        case tags = "Tags"
    }
}
