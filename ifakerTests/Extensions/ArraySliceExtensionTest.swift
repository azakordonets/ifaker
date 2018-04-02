import Foundation
import XCTest
import Nimble
import Quick
@testable import ifaker

class ArraySliceExtensionTests: QuickSpec {
    override func spec() {
        describe("Array slice extension") {
            context("When i call 'randomElement' on array slice") {
                it("Should return random element of this slice") {
                    let upperLimit = 1000000
                    let array = (0...upperLimit).map { _ in
                        Int.random(between: 0, and: upperLimit)
                    }
                    let midpoint = array.count / 2
                    let arraySlice: ArraySlice<Int> = array[midpoint...]
                    let firstRandomNumber = arraySlice.randomItem()
                    let secondRandomNumber = arraySlice.randomItem()
                    expect(arraySlice.count).to(equal(upperLimit / 2 + 1))
                    expect(firstRandomNumber).notTo(equal(secondRandomNumber))
                }
            }
            context("When i call 'randomElement' method on empty array") {
                it("Should return nil") {
                    let array = [Int]()
                    let midpoint = array.count / 2
                    let arraySlice: ArraySlice<Int> = array[midpoint...]
                    expect(arraySlice.randomItem()).to(beNil())
                }
            }
        }

    }
}