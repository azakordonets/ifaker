import Foundation

struct PersonalData: Decodable {
    let religion: [String]
    let zodiac: [String]
    let bloodType: [String]
    let occupation: [String]
}