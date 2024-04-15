// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mOTCOrganization = try? newJSONDecoder().decode(MOTCOrganization.self, from: jsonData)

import Foundation

// MARK: - MOTCOrganization
struct MOTCOrganization: Codable {
    let name: String?
    let organizationClass: String?
    let taxCode: String? /// 組織單位之統一編號
    let agencyCode: String?
    let url: String?
    let telephones: [String]?
    let mobilePhones: [String]?
    let faxes: [String]? /// 傳真電話
    let email: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case organizationClass = "Class"
        case taxCode = "TaxCode"
        case agencyCode = "AgencyCode"
        case url = "URL"
        case telephones = "Telephones"
        case mobilePhones = "MobilePhones"
        case faxes = "Faxes"
        case email = "Email"
    }
}
