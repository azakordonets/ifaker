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
            context("When 'birthdate' method is called with age specified ") {
                it("Should date from now minus specified age") {
                    let age = 25
                    let birthDate = RandomContactInformation.birthDate(at: age)
                    guard let currentDay = Calendar.current.dateComponents(in: .current, from: Date()).day else {
                        return
                    }
                    guard let currentMonth = Calendar.current.dateComponents(in: .current, from: Date()).month else {
                        return
                    }
                    guard let currentYear = Calendar.current.dateComponents(in: .current, from: Date()).year else {
                        return
                    }

                    guard let birthDateDay = Calendar.current.dateComponents(in: .autoupdatingCurrent, from: birthDate).day else {
                        return
                    }

                    guard let birthDateMonth = Calendar.current.dateComponents(in: .autoupdatingCurrent, from: birthDate).month else {
                        return
                    }

                    guard let birthDateYear = Calendar.current.dateComponents(in: .autoupdatingCurrent, from: birthDate).year else {
                        return
                    }
                    expect(birthDateDay).to(equal(currentDay), description: "Birthdate day should be equal to current day")
                    expect(birthDateMonth).to(equal(currentMonth), description: "Birthdate month should be equal to current day")
                    expect(birthDateYear).to(equal(currentYear - age), description: "Birthdate year should be currentYear - age")
                }
            }
            context("When 'birthdate' method is called with age and format specified ") {
                it("Should date from now minus specified age with specific format") {
                    let age = 25
                    let format = "MM/dd/yyyy"
                    let birthDate = RandomContactInformation.birthDate(at: age, withFormat: format)
                    guard let expectedDate = Calendar.current.date(byAdding: .year, value: -25, to: Date()) else {
                        return
                    }
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = format
                    expect(birthDate).to(equal(dateFormatter.string(from: expectedDate)))
                }
            }
            context("When 'email' method is called") {
                it("Should return random email") {
                    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                    let email = RandomContactInformation.email()
                    expect(emailTest.evaluate(with: email)).to(beTrue())
                }
            }
        }
    }
}

