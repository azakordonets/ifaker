import Foundation


struct File: Decodable {
    let mimeTypes: [String]
    let fileExtensions: [String]
}