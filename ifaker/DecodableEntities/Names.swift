import Foundation

struct Names: Decodable {
    enum CodingKeys: String, CodingKey {
        case firstNames = "first_names"
        case lastNames = "last_names"
        case prefixes = "prefixes"
        case suffixes = "suffixes"
    }

    let firstNames: [String]
    let lastNames: [String]
    let prefixes: [String]
    let suffixes: [String]
}