import XCTest
import Nimble
import Quick
@testable import ifaker

class NumberExtensionTests: QuickSpec {
    override func spec() {

        let countableRangeTestData: [(range: CountableRange<Int>, lowerBond: Int, upperBond: Int)] = [
            (range: 0..<100, lowerBond: 0, upperBond: 100),
            (range: 0..<1, lowerBond: 0, upperBond: 1),
            (range: -200..<100, lowerBond: -200, upperBond: 100),
            (range: -200..<(-100), lowerBond: -200, upperBond: -100)
        ]

        let closeCountableRangeTestData: [(range: CountableClosedRange<Int>, lowerBond: Int, upperBond: Int)] = [
            (range: 0...100, lowerBond: 0, upperBond: 100),
            (range: 0...1, lowerBond: 0, upperBond: 1),
            (range: -200...100, lowerBond: -200, upperBond: 100),
            (range: -200...(-100), lowerBond: -200, upperBond: -100)
        ]

        countableRangeTestData.forEach { testData in
            describe("Int has a number of extentions to generate random value") {
                context("When 'random' method is called with \(testData.range) range specified") {
                    it("Should generate random number in that range excluding upper bond") {
                        (0...10).forEach { _ in
                            let randomNumber = Int.random(testData.range)
                            expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                            expect(randomNumber).to(beLessThan(testData.upperBond))
                        }
                    }
                }
            }

            closeCountableRangeTestData.forEach { testData in
                context("When 'random' method is called with \(testData.range) closed range specified") {
                    it("Should generate random number in that range including upper bond") {
                        (0...10).forEach { _ in
                            let randomNumber = Int.random(testData.range)
                            expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                            expect(randomNumber).to(beLessThanOrEqualTo(testData.upperBond))
                        }

                    }
                }

                context("When 'random' method is called with \(testData.lowerBond) lower, \(testData.upperBond) upper bond specified") {
                    it("Should generate random number in that range") {
                        (0...10).forEach { _ in
                            let randomNumber = Int.random(between: testData.lowerBond, and: testData.upperBond)
                            expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                            expect(randomNumber).to(beLessThanOrEqualTo(testData.upperBond))
                        }
                    }
                }
            }

            countableRangeTestData.forEach { testData in
                describe("Int32 extension") {
                    context("When 'random' method is called with \(testData.range) range specified") {
                        it("Should return random Int32 number from that range") {
                            let randomNumber = Int32.random(testData.range)
                            expect(randomNumber).to(beAnInstanceOf(Int32.self))
                            expect(randomNumber).to(beGreaterThanOrEqualTo(Int32(testData.lowerBond)))
                            expect(randomNumber).to(beLessThan(Int32(testData.upperBond)))
                        }
                    }
                    context("When 'random' method is called with \(testData.lowerBond) lower and \(testData.upperBond) upper bounds specified specified") {
                        it("Should return random Int32 number from that range") {
                            let randomNumber = Int32.random(between: testData.lowerBond, and: testData.upperBond)
                            expect(randomNumber).to(beAnInstanceOf(Int32.self))
                            expect(randomNumber).to(beGreaterThanOrEqualTo(Int32(testData.lowerBond)))
                            expect(randomNumber).to(beLessThan(Int32(testData.upperBond)))
                        }
                    }

                    closeCountableRangeTestData.forEach { testData in
                        context("When 'random' method is called with \(testData.range) closed range specified") {
                            it("Should generate random number in that range including upper bond") {
                                (0...10).forEach { _ in
                                    let randomNumber = Int32.random(testData.range)
                                    expect(randomNumber).to(beGreaterThanOrEqualTo(Int32(testData.lowerBond)))
                                    expect(randomNumber).to(beLessThanOrEqualTo(Int32(testData.upperBond)))
                                }

                            }
                        }

                        context("When 'random' method is called with \(testData.lowerBond) lower, \(testData.upperBond) upper bond specified") {
                            it("Should generate random number in that range") {
                                (0...10).forEach { _ in
                                    let randomNumber = Int32.random(between: testData.lowerBond, and: testData.upperBond)
                                    expect(randomNumber).to(beGreaterThanOrEqualTo(Int32(testData.lowerBond)))
                                    expect(randomNumber).to(beLessThanOrEqualTo(Int32(testData.upperBond)))
                                }
                            }
                        }
                    }
                }
            }

            let rangeDoubleTestData: [(range: Range<Double>, lowerBond: Double, upperBond: Double)] = [
                (range: 0.1..<100.1, lowerBond: 0.1, upperBond: 100.1),
                (range: 0.2..<1.5, lowerBond: 0.2, upperBond: 1.5),
                (range: -0.2..<1.5, lowerBond: -0.2, upperBond: 1.5),
                (range: -2.2..<(-0.5), lowerBond: -2.2, upperBond: -0.5)
            ]

            let closedRangeDoubleTestData: [(range: ClosedRange<Double>, lowerBond: Double, upperBond: Double)] = [
                (range: 0.1...100.1, lowerBond: 0.1, upperBond: 100.1),
                (range: 0.2...1.5, lowerBond: 0.2, upperBond: 1.5),
                (range: -0.2...1.5, lowerBond: -0.2, upperBond: 1.5),
                (range: -2.2...(-0.5), lowerBond: -2.2, upperBond: -0.5)
            ]


            rangeDoubleTestData.forEach { testData in
                describe("Double extension") {
                    context("When 'random' method is called with \(testData.range) range specified") {
                        it("Should return random Double number from that range") {
                            let randomNumber = Double.random(testData.range)
                            expect(randomNumber).to(beAnInstanceOf(Double.self))
                            expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                            expect(randomNumber).to(beLessThan(testData.upperBond))
                        }
                    }
                    context("When 'random' method is called with \(testData.lowerBond) lower and \(testData.upperBond) upper bounds specified specified") {
                        it("Should return random Double number from that range") {
                            let randomNumber = Double.random(between: testData.lowerBond, and: testData.upperBond)
                            expect(randomNumber).to(beAnInstanceOf(Double.self))
                            expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                            expect(randomNumber).to(beLessThan(testData.upperBond))
                        }
                    }

                    closedRangeDoubleTestData.forEach { testData in
                        context("When 'random' method is called with \(testData.range) closed range specified") {
                            it("Should generate random number in that range including upper bond") {
                                (0...10).forEach { _ in
                                    let randomNumber = Double.random(testData.range)
                                    expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                                    expect(randomNumber).to(beLessThanOrEqualTo(testData.upperBond))
                                }

                            }
                        }

                        context("When 'random' method is called with \(testData.lowerBond) lower, \(testData.upperBond) upper bond specified") {
                            it("Should generate random number in that range") {
                                (0...10).forEach { _ in
                                    let randomNumber = Double.random(between: testData.lowerBond, and: testData.upperBond)
                                    expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                                    expect(randomNumber).to(beLessThanOrEqualTo(testData.upperBond))
                                }
                            }
                        }
                    }
                }
            }

            let rangeFloatTestData: [(range: Range<Float>, lowerBond: Float, upperBond: Float)] = [
                (range: 0.1..<100.1, lowerBond: 0.1, upperBond: 100.1),
                (range: 0.2..<1.5, lowerBond: 0.2, upperBond: 1.5),
                (range: -0.2..<1.5, lowerBond: -0.2, upperBond: 1.5),
                (range: -2.2..<(-0.5), lowerBond: -2.2, upperBond: -0.5)
            ]

            let closedRangeFloatTestData: [(range: ClosedRange<Float>, lowerBond: Float, upperBond: Float)] = [
                (range: 0.1...100.1, lowerBond:  0.1, upperBond: 100.1),
                (range: 0.2...1.5, lowerBond:  0.2, upperBond: 1.5),
                (range: -0.2...1.5, lowerBond: -0.2, upperBond: 1.5),
                (range: -2.2...(-0.5), lowerBond: -2.2, upperBond: -0.5)
            ]


            rangeFloatTestData.forEach { testData in
                describe("Float extension") {
                    context("When 'random' method is called with \(testData.range) range specified") {
                        it("Should return random Float number from that range") {
                            let randomNumber = Float.random(testData.range)
                            expect(randomNumber).to(beAnInstanceOf(Float.self))
                            expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                            expect(randomNumber).to(beLessThan(testData.upperBond))
                        }
                    }
                    context("When 'random' method is called with \(testData.lowerBond) lower and \(testData.upperBond) upper bounds specified specified") {
                        it("Should return random Float number from that range") {
                            let randomNumber = Float.random(between: testData.lowerBond, and: testData.upperBond)
                            expect(randomNumber).to(beAnInstanceOf(Float.self))
                            expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                            expect(randomNumber).to(beLessThan(testData.upperBond))
                        }
                    }

                    closedRangeFloatTestData.forEach { testData in
                        context("When 'random' method is called with \(testData.range) closed range specified") {
                            it("Should generate random number in that range including upper bond") {
                                (0...10).forEach { _ in
                                    let randomNumber = Float.random(testData.range)
                                    expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                                    expect(randomNumber).to(beLessThanOrEqualTo(testData.upperBond))
                                }

                            }
                        }

                        context("When 'random' method is called with \(testData.lowerBond) lower, \(testData.upperBond) upper bond specified") {
                            it("Should generate random number in that range") {
                                (0...10).forEach { _ in
                                    let randomNumber = Float.random(between: testData.lowerBond, and: testData.upperBond)
                                    expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                                    expect(randomNumber).to(beLessThanOrEqualTo(testData.upperBond))
                                }
                            }
                        }
                    }
                }
            }

            let rangeCGFloatTestData: [(range: Range<CGFloat>, lowerBond: CGFloat, upperBond: CGFloat)] = [
                (range: 0.1..<100.1, lowerBond: 0.1, upperBond: 100.1),
                (range: 0.2..<1.5, lowerBond: 0.2, upperBond: 1.5),
                (range: -0.2..<1.5, lowerBond: -0.2, upperBond: 1.5),
                (range: -2.2..<(-0.5), lowerBond: -2.2, upperBond: -0.5)
            ]

            let closedRangeCGFloatTestData: [(range: ClosedRange<CGFloat>, lowerBond: CGFloat, upperBond: CGFloat)] = [
                (range: 0.1...100.1, lowerBond:  0.1, upperBond: 100.1),
                (range: 0.2...1.5, lowerBond:  0.2, upperBond: 1.5),
                (range: -0.2...1.5, lowerBond: -0.2, upperBond: 1.5),
                (range: -2.2...(-0.5), lowerBond: -2.2, upperBond: -0.5)
            ]


            rangeCGFloatTestData.forEach { testData in
                describe("CGFloat extension") {
                    context("When 'random' method is called with \(testData.range) range specified") {
                        it("Should return random CGFloat number from that range") {
                            let randomNumber = CGFloat.random(testData.range)
                            expect(randomNumber).to(beAnInstanceOf(CGFloat.self))
                            expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                            expect(randomNumber).to(beLessThan(testData.upperBond))
                        }
                    }
                    context("When 'random' method is called with \(testData.lowerBond) lower and \(testData.upperBond) upper bounds specified specified") {
                        it("Should return random CGFloat number from that range") {
                            let randomNumber = CGFloat.random(between: testData.lowerBond, and: testData.upperBond)
                            expect(randomNumber).to(beAnInstanceOf(CGFloat.self))
                            expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                            expect(randomNumber).to(beLessThan(testData.upperBond))
                        }
                    }

                    closedRangeCGFloatTestData.forEach { testData in
                        context("When 'random' method is called with \(testData.range) closed range specified") {
                            it("Should generate random number in that range including upper bond") {
                                (0...10).forEach { _ in
                                    let randomNumber = CGFloat.random(testData.range)
                                    expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                                    expect(randomNumber).to(beLessThanOrEqualTo(testData.upperBond))
                                }

                            }
                        }

                        context("When 'random' method is called with \(testData.lowerBond) lower, \(testData.upperBond) upper bond specified") {
                            it("Should generate random number in that range") {
                                (0...10).forEach { _ in
                                    let randomNumber = CGFloat.random(between: testData.lowerBond, and: testData.upperBond)
                                    expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                                    expect(randomNumber).to(beLessThanOrEqualTo(testData.upperBond))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
