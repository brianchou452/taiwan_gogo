// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mOTCTelephone = try? newJSONDecoder().decode(MOTCTelephone.self, from: jsonData)

import Foundation

// MARK: - MOTCTelephone
struct MOTCTelephone: Codable {
    let tel: String?
    let ext: Int?

    enum CodingKeys: String, CodingKey {
        case tel = "Tel"
        case ext = "Ext"
    }
}
