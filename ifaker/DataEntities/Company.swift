import Foundation


struct Company: Decodable {
    let companySuffix: [String]

    enum CodingKeys: String, CodingKey {
        case companySuffix = "company_suffix"
    }
}