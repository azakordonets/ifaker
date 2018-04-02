import Foundation

struct Address: Decodable {
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case cityPrefix = "city_prefix"
        case city_suffix = "city_suffix"
        case streetSuffix = "street_suffix"
        case appNumber = "app_number"
        case state = "state"
        case stateAbbr = "state_abbr"
    }
    let country: [String]
    let cityPrefix: [String]
    let citySuffix: [String]
    let streetSuffix: [String]
    let appNumber: [String]
    let state: [String]
    let stateAbbr: [String]


}