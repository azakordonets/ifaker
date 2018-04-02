import XCTest
import Nimble
import Quick
@testable import ifaker

class PlistReaderTests: QuickSpec {
    override func spec() {
        describe("Plist reader allows us to read test data from plist for further usage") {
            context("When in words.plist i try to search for 'words' array") {
                it("Should return an array of words") {
                    guard let wordsArray = ResourcesPlistDecoder.getValue(of: "words", from: "words", as: [String].self) else {
                        return
                    }
                    expect(wordsArray).notTo(beNil())
                    expect(wordsArray.count).to(beGreaterThan(0))

                }
            }
        }
    }
}