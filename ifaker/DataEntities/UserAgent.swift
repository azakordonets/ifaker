import Foundation

struct UserAgent: Decodable {
    enum CodingKeys: String, CodingKey {
        case browser = "browser"
        case windows = "windows"
        case linuxProcessor = "linux_processor"
        case macProcessor = "mac_processor"
        case langs = "langs"
    }

    let browser: [String]
    let windows: [String]
    let linuxProcessor: [String]
    let macProcessor: [String]
    let langs: [String]
}
