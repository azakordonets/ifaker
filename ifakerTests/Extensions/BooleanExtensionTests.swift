import XCTest
import Nimble
import Quick
@testable import ifaker

class BooleanExtensionTests: QuickSpec {
    override func spec() {
        describe("Boolean has an extention") {
            context("When i call 'random' method on boolean") {
                it("Should return boolean") {
                    let randomBoolean = Bool.random()
                    expect(randomBoolean).notTo(beNil())
                    expect(randomBoolean).to(beAnInstanceOf(Bool.self))
                }
            }
        }
    }
}
