/*
 * IntExtentionTests.swift
 *
 * Copyright (c) 2012-2017 Vimpelcom Ltd.
 * All rights reserved.
 *
 * This software is the proprietary copyright of Vimpelcom Ltd.
 * and has been licensed for internal evaluation purposes only. If you are
 * the licensee, you are not permitted to further distribute this software
 * or to use it for any purpose other than internal evaluation. If you are
 * not the licensee then you are not authorised to use this software in
 * any manner and should immediately return it to Vimpelcom Ltd.
 *
 */

import XCTest
import Nimble
import Quick
@testable import ifaker

class NumberExtensionTests: QuickSpec {
    override func spec() {

        let countableRangeTestData: [(range: CountableRange<Int>, lowerBond: Int, upperBond: Int)] = [
            (0..<100, 0, 100),
            (0..<1, 0, 1),
            (-200..<100, -200, 100),
            (-200..<(-100), -200, -100)
        ]

        let closeCountableRangeTestData: [(range: CountableClosedRange<Int>, lowerBond: Int, upperBond: Int)] = [
            (0...100, 0, 100),
            (0...1, 0, 1),
            (-200...1, -200, 1),
            (-200...(-1), -200, -1)
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
                (0.1..<100.1, 0.1, 100.1),
                (0.2..<1.5, 0.2, 1.5),
                (-0.2..<1.5, -0.2, 1.5),
                (-2.2..<(-0.5), -2.2, -0.5)
            ]

            let closedRangeDoubleTestData: [(range: ClosedRange<Double>, lowerBond: Double, upperBond: Double)] = [
                (0.1...100.1, 0.1, 100.1),
                (0.2...1.5, 0.2, 1.5),
                (-0.2...1.5, -0.2, 1.5),
                (-2.2...(-0.5), -2.2, -0.5)
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
                (0.1..<100.1, 0.1, 100.1),
                (0.2..<1.5, 0.2, 1.5),
                (-0.2..<1.5, -0.2, 1.5),
                (-2.2..<(-0.5), -2.2, -0.5)
            ]

            let closedRangeFloatTestData: [(range: ClosedRange<Float>, lowerBond: Float, upperBond: Float)] = [
                (0.1...100.1, 0.1, 100.1),
                (0.2...1.5, 0.2, 1.5),
                (-0.2...1.5, -0.2, 1.5),
                (-2.2...(-0.5), -2.2, -0.5)
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
        }
    }
}
