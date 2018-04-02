import XCTest
import Nimble
import Quick
@testable import ifaker

class ArrayExtensionTests: QuickSpec {
    override func spec() {
        describe("Array has an extention") {
            context("When i call 'randomElement' method on array") {
                it("Should return random element of array") {
                    let randomNumberArray = (1...1000000).map { _ in
                        Int.random()
                    }
                    let firstRandomNumber = randomNumberArray.randomItem()
                    let secondRandomNumber = randomNumberArray.randomItem()
                    expect(firstRandomNumber).notTo(equal(secondRandomNumber))
                }
            }
            context("When i call 'randomElement' method on empty array") {
                it("Should return nil") {
                    let randomNumberArray = [Int]()
                    expect(randomNumberArray.randomItem()).to(beNil())
                }
            }
        }
    }
}

