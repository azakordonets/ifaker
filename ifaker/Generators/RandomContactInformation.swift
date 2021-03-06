import Foundation

struct RandomContactInformation {

    static let _names: Names = ResourcesPlistDecoder.getDecodedEntity(from: .names, as: Names.self)

    static func firstName() -> String {
        guard let firstName = self._names.firstNames.randomItem() else {
            return "Not Found"
        }
        return firstName
    }

    static func lastName() -> String {
        guard let lastName = self._names.lastNames.randomItem() else {
            return "Not Found"
        }
        return lastName
    }

    static func prefix() -> String {
        guard let prefix = self._names.prefixes.randomItem() else {
            return "Not Found"
        }
        return prefix
    }

    static func suffix() -> String {
        guard let suffix = self._names.suffixes.randomItem() else {
            return "Not Found"
        }
        return suffix
    }

    static func fullName(withSuffix useSuffix: Bool = false, withPrefix usePrefix: Bool = false) -> String {
        let firstName = self.firstName()
        let lastName = self.lastName()
        let prefix = usePrefix ? self.prefix() : ""
        let suffix = useSuffix ? self.suffix() : ""
        return "\(prefix) \(firstName) \(lastName) \(suffix)".trimmingCharacters(in: .whitespaces)
    }

    static func birthDate(at age: Int) -> Date {
        guard let birthDate = Calendar.current.date(byAdding: .year, value: -age, to: Date()) else {
            print("Couldn't create birthdate for \(age) years old person")
            return Date()
        }
        return birthDate
    }

    static func birthDate(at age: Int, withFormat format: String = "dd/MM/yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self.birthDate(at: age))
    }

    static func email(using domain: String = "test.com") -> String {
        return "\(RandomContactInformation.firstName())_" +
                "\(RandomContactInformation.lastName())\(Int.random(between: 0, and: 1000))\(domain)".lowercased()
    }

}
