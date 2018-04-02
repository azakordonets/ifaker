import Foundation

class ResourcesPlistDecoder {

    enum Resources {
        case address, calendar, company, file, finance, internet, names, personalData, phoneNumber, userAgent, words

        var fileName: String {
            switch self {
            case .address: return "address"
            case .calendar: return "calendar"
            case .company: return "company"
            case .file: return "file"
            case .finance: return "finance"
            case .internet: return "internet"
            case .names: return "names"
            case .personalData: return "personal_data"
            case .phoneNumber: return "phone_number"
            case .userAgent: return "user_agent"
            case .words: return "words"
            }
        }
    }

    static func getValue<T: Any>(of key: String,
                                 from resourceName: String,
                                 withExtension `extension`: String = "plist",
                                 as type: T.Type) -> T? {
        guard let URL = Bundle(for: self).url(forResource: resourceName, withExtension: `extension`) else {
            print("I was not able to find \(resourceName).\(`extension`) resource file")
            return nil
        }
        guard let fileContent = NSDictionary(contentsOf: URL) as? [String: Any] else {
            print("I was not able to read \(key) content and convert it into [String: Any]")
            return nil
        }
        return fileContent[key] as? T
    }

    static func getDecodedEntity<T: Decodable>(from resource: Resources, as expectedType: T.Type) -> T {
        guard let url = Bundle(for: self).url(forResource: resource.fileName, withExtension: "plist") else {
            print("I was not able to find \(resource.fileName).plist file")
            return NonExisting() as! T
        }
        guard let data = try? Data(contentsOf: url) else {
            print(" I couldn't read data from \(url) url")
            return NonExisting() as! T
        }
        let decoder = PropertyListDecoder()

        guard let decodedEntity = try? decoder.decode(expectedType, from: data) else {
            print("Couldn't decode \(data) into \(expectedType)")
            return NonExisting() as! T
        }

        return decodedEntity
    }

}
