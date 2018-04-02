import Foundation


struct Finance: Decodable {
    let countryCode: [String]
    let branchCode: [String]
    let ssn: [String]
    let bic: [String]
    let accountNumber: [String]
    let visaPrefix: [String]
    let mastercardPrefix: [String]
    let amexPrefix: [String]
    let discoveryPrefix: [String]
    let dinnersPrefix: [String]
    let enroutePrefix: [String]
    let jcbPrefix: [String]
    let voyagePrefix: [String]
}