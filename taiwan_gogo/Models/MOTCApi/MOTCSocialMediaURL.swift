// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mOTCSocialMediaURL = try? newJSONDecoder().decode(MOTCSocialMediaURL.self, from: jsonData)

import Foundation

// MARK: - MOTCSocialMediaURL
struct MOTCSocialMediaURL: Codable {
    let name: String?
    let socialMediaDescription: String?
    let url: String?
    let keywords: [String]?
    let tags: [String]?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case socialMediaDescription = "Description"
        case url = "URL"
        case keywords = "Keywords"
        case tags = "Tags"
    }
}
