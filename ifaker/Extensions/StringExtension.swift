import Foundation

public extension String {

    private static let wordsArray: Words = ResourcesPlistDecoder.getDecodedEntity(from: .words, as: Words.self)

    enum CharSets: String {
        case lowerCaseLettersOnly = "abcdefghijklmnopqrstuvwxyz"
        case lowerCaseLettersAndNumbers = "abcdefghijklmnopqrstuvwxyz0123456789"
        case upperCaseLettersOnly = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        case upperCaseLettersAndNumbers = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        case mixedCaseLettersOnly = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        case mixedCaseLettersAndNumbers = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890"
        case specialSymbols = "!@#$%^&*()_+-=⁄€‹›†̂‡°·‚—±”’{}Æ»|'?/,.<>`~"
        case numbersOnly = "0123456789"

        var chars: String {
            return self.rawValue
        }
    }

    public static func random(ofLength length: Int) -> String {
        return random(minLength: length, maxLength: length)
    }


    public static func random(minLength min: Int, maxLength max: Int) -> String {
        return random(
                fromChars: CharSets.mixedCaseLettersAndNumbers.chars,
                minLength: min,
                maxLength: max
        )
    }


    public static func random(fromChars string: String, ofLength length: Int) -> String {
        return random(
                fromChars: string,
                minLength: length,
                maxLength: length
        )
    }


    public static func random(fromChars string: String, minLength min: Int, maxLength max: Int) -> String {
        guard min > 0 && max >= min else {
            return ""
        }

        let length: Int = (min < max) ? .random(min...max) : max
        var randomString = ""

        (1...length).forEach { _ in
            let randomIndex: Int = .random(0..<string.count)
            let c = string.index(string.startIndex, offsetBy: randomIndex)
            randomString += String(string[c])
        }

        return randomString
    }

    public func letterify(with charsSet: CharSets = .mixedCaseLettersOnly) -> String {
        return self.map {
            return $0 == "?" ? String.random(fromChars: charsSet.chars, ofLength: 1) : String($0)
        }.joined()
    }

    public func numerify() -> String {
        return self.map {
            return $0 == "#" ? String.random(fromChars: CharSets.numbersOnly.chars, ofLength: 1) : String($0)
        }.joined()
    }

    public func botify(with charSet: CharSets = .mixedCaseLettersOnly) -> String {
        return self.letterify(with: charSet).numerify()
    }

    public static func word() -> String {
        guard let word = self.wordsArray.words.randomItem() else {
            return "Not Found"
    }
        return word
    }

    public static func sentence(words numberOfWords: Int = 10) -> String {
        return (0..<numberOfWords).map { _ in
            self.word()
        }.joined(separator: " ")
    }

    public static func paragraph(sentences sentencesNumber: Int = 10) -> String {
        return (0..<sentencesNumber).map { _ in
            self.sentence()
        }.joined(separator: ". ")
    }
}
