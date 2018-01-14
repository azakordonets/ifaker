//
//  StringTests.swift
//  ifaker
//
//  Created by andrew zakordonets on 11/12/2017.
//  Copyright © 2017 biercoff. All rights reserved.
//

import XCTest
import Nimble
import Quick
@testable import ifaker

class StringExtensionTests: QuickSpec {
    override func spec() {
        describe("ifaker provides String extension ") {
            let testData = [10: 10, 0: 0, -5: 0]
            for (length, expectedStringLength) in testData {
                context("When it generates random string of \(length) characters length") {
                    it("Should return random string of \(expectedStringLength) length") {
                        let randomString = String.random(ofLength: length)
                        expect(randomString).to(beAnInstanceOf(String.self))
                        expect(randomString.count).to(equal(expectedStringLength))
                    }
                }
            }
        }

        describe("ifaker provides String extension. ") {

            let testData: [(minLength: Int, maxLength: Int, expectedLengthRange: (minLength: Int, maxLength: Int))] = [
                (minLength: 0, maxLength: 100,
                        expectedLengthRange: (minLength: 0, maxLength: 100)),
                (minLength: -1, maxLength: 100,
                        expectedLengthRange: (minLength: 0, maxLength: 100)),
                (minLength: 10, maxLength: 100,
                        expectedLengthRange: (minLength: 10, maxLength: 100)),
                (minLength: 100, maxLength: 10,
                        expectedLengthRange: (minLength: 0, maxLength: 10))
            ]

            for randomStringConfig in testData {
                let minLength = randomStringConfig.minLength
                let maxLength = randomStringConfig.maxLength
                let expectedMinLength = randomStringConfig.expectedLengthRange.minLength
                let expectedMaxLength = randomStringConfig.expectedLengthRange.maxLength
                context("When it generates random string with \(minLength)-\(maxLength) length range") {
                    it("Should return random string with \(expectedMinLength)-\(expectedMaxLength) length range") {
                        let randomString = String.random(minLength: minLength, maxLength: maxLength)
                        expect(randomString).to(beAnInstanceOf(String.self))
                        expect(randomString.count).to(beGreaterThanOrEqualTo(expectedMinLength))
                        expect(randomString.count).to(beLessThanOrEqualTo(expectedMaxLength))
                    }
                }
            }
        }

        describe("ifaker provides String extension. ") {

            let testData: [(chars: String, length: Int)] = [
                (chars: "abc", length: 10),
                (chars: "", length: 0),
                (chars: "abcdefghijklmnoprstuvwzy1234567890-=+`~`?/.><,'|\\", length: 200)
            ]
            for randomDataConfig in testData {
                let chars: String = randomDataConfig.chars
                let maxLength: Int = randomDataConfig.length
                context("When it generates random string out of '\(chars)' chars set with \(maxLength)") {
                    it("Should return random string with only сhars from specified set with \(maxLength) length") {
                        let randomString = String.random(fromChars: chars, ofLength: maxLength)
                        expect(randomString.count).to(beLessThanOrEqualTo(maxLength))
                        for char in randomString {
                            expect(chars).to(contain(char))
                        }
                    }
                }

            }
        }

        describe("ifaker provides String extension that allows to modify String following the pattern") {
            let lettersOnlyPattern = "[a-zA-Z]"
            let letterifyTestData: [(originalString: String, expectedResultRegexPattern: String)] = [
                (originalString: "abc123", expectedResultRegexPattern: "abc123"),
                (originalString: "abc123?", expectedResultRegexPattern: "abc123\(lettersOnlyPattern)"),
                (originalString: "?abc123?", expectedResultRegexPattern: "\(lettersOnlyPattern)abc123\(lettersOnlyPattern)"),
                (originalString: "?abc?123?", expectedResultRegexPattern: "\(lettersOnlyPattern)abc\(lettersOnlyPattern)123\(lettersOnlyPattern)"),
                (originalString: "?abc?123?#", expectedResultRegexPattern: "\(lettersOnlyPattern)abc\(lettersOnlyPattern)123\(lettersOnlyPattern)#"),
                (originalString: "#?abc?123?#", expectedResultRegexPattern: "#\(lettersOnlyPattern)abc\(lettersOnlyPattern)123\(lettersOnlyPattern)#"),
                (originalString: "#?abc?#123?#", expectedResultRegexPattern: "#\(lettersOnlyPattern)abc\(lettersOnlyPattern)#123\(lettersOnlyPattern)#"),
                (originalString: "", expectedResultRegexPattern: "^(?![\\s\\S])"),
            ]
            for testData in letterifyTestData {
                context("When 'letterify' method is called on '\(testData.originalString)'") {
                    it("Should return string that replaces '?' with random char and match " +
                            "\(testData.expectedResultRegexPattern) regex pattern") {
                        expect(testData.originalString.letterify()).to(match(testData.expectedResultRegexPattern))
                    }
                }
            }
            let numbersOnlyPattern = "[0-9]"
            let numerifyTestData: [(originalString: String, expectedResultRegexPattern: String)] = [
                (originalString: "abc123", expectedResultRegexPattern: "abc123"),
                (originalString: "abc123#", expectedResultRegexPattern: "abc123\(numbersOnlyPattern)"),
                (originalString: "#abc123#", expectedResultRegexPattern: "\(numbersOnlyPattern)abc123\(numbersOnlyPattern)"),
                (originalString: "#abc#123#", expectedResultRegexPattern: "\(numbersOnlyPattern)abc\(numbersOnlyPattern)123\(numbersOnlyPattern)"),
                (originalString: "#abc#123#?", expectedResultRegexPattern: "\(numbersOnlyPattern)abc\(numbersOnlyPattern)123\(numbersOnlyPattern)\\?"),
                (originalString: "#?abc?123?#", expectedResultRegexPattern: "\(numbersOnlyPattern)\\?abc\\?123\\?\(numbersOnlyPattern)"),
                (originalString: "#?abc?#123?#", expectedResultRegexPattern: "\(numbersOnlyPattern)\\?abc\\?\(numbersOnlyPattern)123\\?\(numbersOnlyPattern)"),
                (originalString: "", expectedResultRegexPattern: "^(?![\\s\\S])"),
            ]
            for testData in numerifyTestData {
                context("When 'numerify' method is called on '\(testData.originalString)'") {
                    it("Should return string that replaces '#' with random number and match " +
                            "\(testData.expectedResultRegexPattern) regex pattern") {
                        expect(testData.originalString.numerify()).to(match(testData.expectedResultRegexPattern))
                    }
                }
            }

            let botifyTestData: [(originalString: String, expectedResultRegexPattern: String)] = [
                (originalString: "abc123", expectedResultRegexPattern: "abc123"),
                (originalString: "abc123#", expectedResultRegexPattern: "abc123\(numbersOnlyPattern)"),
                (originalString: "#abc123#", expectedResultRegexPattern: "\(numbersOnlyPattern)abc123\(numbersOnlyPattern)"),
                (originalString: "#abc#123#", expectedResultRegexPattern: "\(numbersOnlyPattern)abc\(numbersOnlyPattern)123\(numbersOnlyPattern)"),
                (originalString: "#abc#123#?", expectedResultRegexPattern: "\(numbersOnlyPattern)abc\(numbersOnlyPattern)123\(numbersOnlyPattern)\(lettersOnlyPattern)"),
                (originalString: "#?abc?123?#", expectedResultRegexPattern: "\(numbersOnlyPattern)\(lettersOnlyPattern)abc\(lettersOnlyPattern)123\(lettersOnlyPattern)\(numbersOnlyPattern)"),
                (originalString: "#?abc?#123?#", expectedResultRegexPattern: "\(numbersOnlyPattern)\(lettersOnlyPattern)abc\(lettersOnlyPattern)\(numbersOnlyPattern)123\(lettersOnlyPattern)\(numbersOnlyPattern)"),
                (originalString: "", expectedResultRegexPattern: "^(?![\\s\\S])"),
            ]
            for testData in botifyTestData {
                context("When 'botify' method is called on '\(testData.originalString)'") {
                    it("Should return string that replaces '#' with random number, " +
                            "'?' with random letter and match " +
                            "\(testData.expectedResultRegexPattern) regex pattern") {
                        expect(testData.originalString.botify()).to(match(testData.expectedResultRegexPattern))
                    }
                }
            }
        }

        describe("ifaker provides String extention that allows to generate fake word, phrase sentence") {
            let words = PlistReader.getValue(of: "words", from: "words", withExtension: "plist", as: [String].self)
            expect(words).toNot(beNil())
            context("When 'word' method is called") {
                it("Should return a random word from an existing plist file filled with words") {
                    let word = String.word()
                    expect(word).toNot(be("undefined"))
                    expect(words).to(contain(word))
                }
            }
            context("When 'sentence' method is called") {
                it("Should a return a random sentence with 10 words length") {
                    let sentence = String.sentence()
                    let splitSentence: [String] = sentence.components(separatedBy: " ")
                    expect(splitSentence.count).to(equal(10))
                    splitSentence.forEach { word in
                        expect(words).to(contain(word))
                    }
                }
            }
            context("When 'sentence' method is called with custom number of words") {
                it("Should return random sentence with custom number of words") {
                    let numberOfWords = 20
                    let sentence = String.sentence(words: numberOfWords)
                    let splitSentence: [String] = sentence.components(separatedBy: " ")
                    expect(splitSentence.count).to(equal(numberOfWords))
                    splitSentence.forEach { word in
                        expect(words).to(contain(word))
                    }
                }
            }
            context("When 'paragraph' method is called") {
                it("Should return random paragraph with 10 sentences in it") {
                    let paragraph = String.paragraph()
                    let splitParagraph: [String] = paragraph.components(separatedBy: ". ")
                    expect(splitParagraph.count).to(equal(10))
                    splitParagraph.forEach { sentence in
                        expect(sentence.components(separatedBy: " ").count).to(equal(10)
                        )
                    }
                }
            }

            context("When 'paragraph' method is called with custom length") {
                it("Should return random paragraph with custom number of sentences in it") {
                    let numberOfSentences = 20
                    let paragraph = String.paragraph(sentences: numberOfSentences)
                    let splitParagraph: [String] = paragraph.components(separatedBy: ". ")
                    expect(splitParagraph.count).to(equal(numberOfSentences))
                    splitParagraph.forEach { sentence in
                        expect(sentence.components(separatedBy: " ").count).to(equal(10)
                        )
                    }
                }
            }

        }
    }

}
