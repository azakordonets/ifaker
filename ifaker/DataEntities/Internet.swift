import Foundation

struct Internet: Decodable {
    enum CodingKeys: String, CodingKey {
        case freeEmail = "free_email"
        case domainSuffix = "domain_suffix"
        case avatar = "avatar"
    }

    let freeEmail: [String]
    let domainSuffix: [String]
    let avatar: [String]
}