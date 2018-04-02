import XCTest
import Nimble
import Quick
@testable import ifaker

class ContactGeneratorTests: QuickSpec {
    override func spec() {
        describe("Random contact generator") {
            context("When 'firstName' method is called") {
                it("Should return random first name") {
                    let firstName = RandomContactInformation.firstName()
                    expect(firstName).notTo(beEmpty())
                    expect(RandomContactInformation._names.firstNames).to(contain(firstName),
                            description: "I expect first name to be present in array of test names")
                }
            }
            context("When 'lastName' method is called") {
                it("Should return random last name") {
                    let lastName = RandomContactInformation.lastName()
                    expect(lastName).notTo(beEmpty())
                    expect(RandomContactInformation._names.lastNames).to(contain(lastName),
                            description: "I expect last name to be present in array of test names")
                }
            }
            context("When 'suffix' method is called") {
                it("Should return random suffix") {
                    let suffix = RandomContactInformation.suffix()
                    expect(suffix).notTo(beEmpty())
                    expect(RandomContactInformation._names.suffixes).to(contain(suffix),
                            description: "I expect suffix to be present in array of test names")
                }
            }
            context("When 'prefix' method is called") {
                it("Should return random prefix") {
                    let prefix = RandomContactInformation.prefix()
                    expect(prefix).notTo(beEmpty())
                    expect(RandomContactInformation._names.prefixes).to(contain(prefix),
                            description: "I expect prefix to be present in array of test names")
                }
            }
            context("When 'fullName' method is called") {
                it("Should return full name without prefix or suffix") {
                    let fullName = RandomContactInformation.fullName()
                    expect(fullName).notTo(beEmpty())
                    let firstName = fullName.components(separatedBy: " ")[0]
                    expect(RandomContactInformation._names.firstNames).to(contain(firstName),
                            description: "I expect first name to be present in array of test names")
                    let lastName = fullName.components(separatedBy: " ")[1]
                    expect(RandomContactInformation._names.lastNames).to(contain(lastName),
                            description: "I expect last name to be present in array of test names")
                }
            }
            context("When 'fullName' method is called with suffix and prefix enabled") {
                it("Should return full name without prefix or suffix") {
                    let fullName = RandomContactInformation.fullName(withSuffix: true, withPrefix: true)
                    expect(fullName).notTo(beEmpty())

                    let prefix = fullName.components(separatedBy: " ")[0]
                    expect(RandomContactInformation._names.prefixes).to(contain(prefix),
                            description: "I expect prefix to be present in array of test names")

                    let firstName = fullName.components(separatedBy: " ")[1]
                    expect(RandomContactInformation._names.firstNames).to(contain(firstName),
                            description: "I expect first name to be present in array of test names")

                    let lastName = fullName.components(separatedBy: " ")[2]
                    expect(RandomContactInformation._names.lastNames).to(contain(lastName),
                            description: "I expect last name to be present in array of test names")

                    let suffix = fullName.components(separatedBy: " ")[3]
                    expect(RandomContactInformation._names.suffixes).to(contain(suffix),
                            description: "I expect suffix to be present in array of test names")
                }
            }
        }
    }
}

