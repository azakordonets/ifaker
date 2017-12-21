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

class StringTests: QuickSpec {
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
            struct RandomStringConfig {
                let minLength: Int
                let maxLength: Int
                let expectedLengthRange: ExpectedStringRange
            }

            struct ExpectedStringRange {
                let minLength: Int
                let maxLength: Int
            }

            let testData = [
                RandomStringConfig(minLength: 0, maxLength: 100,
                        expectedLengthRange: ExpectedStringRange(minLength: 0, maxLength: 100)),
                RandomStringConfig(minLength: -1, maxLength: 100,
                        expectedLengthRange: ExpectedStringRange(minLength: 0, maxLength: 100)),
                RandomStringConfig(minLength: 10, maxLength: 100,
                        expectedLengthRange: ExpectedStringRange(minLength: 10, maxLength: 100)),
                RandomStringConfig(minLength: 100, maxLength: 10,
                        expectedLengthRange: ExpectedStringRange(minLength: 0, maxLength: 10))
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
            struct RandomStringConfig {
                let chars: String
                let length: Int
            }

            let testData = [
                RandomStringConfig(chars: "abc", length: 10),
                RandomStringConfig(chars: "", length: 0),
                RandomStringConfig(chars: "abcdefghijklmnoprstuvwzy1234567890-=+`~`?/.><,'|\\", length: 200)
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
            struct TestData {
                let originalString: String
                let expectedResultRegexPattern: String
            }
            let lettersOnlyPattern = "[a-zA-Z]"
            let letterifyTestData = [
                TestData(originalString: "abc123", expectedResultRegexPattern: "abc123"),
                TestData(originalString: "abc123?", expectedResultRegexPattern: "abc123\(lettersOnlyPattern)"),
                TestData(originalString: "?abc123?", expectedResultRegexPattern: "\(lettersOnlyPattern)abc123\(lettersOnlyPattern)"),
                TestData(originalString: "?abc?123?", expectedResultRegexPattern: "\(lettersOnlyPattern)abc\(lettersOnlyPattern)123\(lettersOnlyPattern)"),
                TestData(originalString: "?abc?123?#", expectedResultRegexPattern: "\(lettersOnlyPattern)abc\(lettersOnlyPattern)123\(lettersOnlyPattern)#"),
                TestData(originalString: "#?abc?123?#", expectedResultRegexPattern: "#\(lettersOnlyPattern)abc\(lettersOnlyPattern)123\(lettersOnlyPattern)#"),
                TestData(originalString: "#?abc?#123?#", expectedResultRegexPattern: "#\(lettersOnlyPattern)abc\(lettersOnlyPattern)#123\(lettersOnlyPattern)#"),
                TestData(originalString: "", expectedResultRegexPattern: "^(?![\\s\\S])"),
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
            let numerifyTestData = [
                TestData(originalString: "abc123", expectedResultRegexPattern: "abc123"),
                TestData(originalString: "abc123#", expectedResultRegexPattern: "abc123\(numbersOnlyPattern)"),
                TestData(originalString: "#abc123#", expectedResultRegexPattern: "\(numbersOnlyPattern)abc123\(numbersOnlyPattern)"),
                TestData(originalString: "#abc#123#", expectedResultRegexPattern: "\(numbersOnlyPattern)abc\(numbersOnlyPattern)123\(numbersOnlyPattern)"),
                TestData(originalString: "#abc#123#?", expectedResultRegexPattern: "\(numbersOnlyPattern)abc\(numbersOnlyPattern)123\(numbersOnlyPattern)\\?"),
                TestData(originalString: "#?abc?123?#", expectedResultRegexPattern: "\(numbersOnlyPattern)\\?abc\\?123\\?\(numbersOnlyPattern)"),
                TestData(originalString: "#?abc?#123?#", expectedResultRegexPattern: "\(numbersOnlyPattern)\\?abc\\?\(numbersOnlyPattern)123\\?\(numbersOnlyPattern)"),
                TestData(originalString: "", expectedResultRegexPattern: "^(?![\\s\\S])"),
            ]
            for testData in numerifyTestData {
                context("When 'numerify' method is called on '\(testData.originalString)'") {
                    it("Should return string that replaces '#' with random number and match " +
                            "\(testData.expectedResultRegexPattern) regex pattern") {
                        expect(testData.originalString.numerify()).to(match(testData.expectedResultRegexPattern))
                    }
                }
            }

            let botifyTestData = [
                TestData(originalString: "abc123", expectedResultRegexPattern: "abc123"),
                TestData(originalString: "abc123#", expectedResultRegexPattern: "abc123\(numbersOnlyPattern)"),
                TestData(originalString: "#abc123#", expectedResultRegexPattern: "\(numbersOnlyPattern)abc123\(numbersOnlyPattern)"),
                TestData(originalString: "#abc#123#", expectedResultRegexPattern: "\(numbersOnlyPattern)abc\(numbersOnlyPattern)123\(numbersOnlyPattern)"),
                TestData(originalString: "#abc#123#?", expectedResultRegexPattern: "\(numbersOnlyPattern)abc\(numbersOnlyPattern)123\(numbersOnlyPattern)\(lettersOnlyPattern)"),
                TestData(originalString: "#?abc?123?#", expectedResultRegexPattern: "\(numbersOnlyPattern)\(lettersOnlyPattern)abc\(lettersOnlyPattern)123\(lettersOnlyPattern)\(numbersOnlyPattern)"),
                TestData(originalString: "#?abc?#123?#", expectedResultRegexPattern: "\(numbersOnlyPattern)\(lettersOnlyPattern)abc\(lettersOnlyPattern)\(numbersOnlyPattern)123\(lettersOnlyPattern)\(numbersOnlyPattern)"),
                TestData(originalString: "", expectedResultRegexPattern: "^(?![\\s\\S])"),
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
    }
}
