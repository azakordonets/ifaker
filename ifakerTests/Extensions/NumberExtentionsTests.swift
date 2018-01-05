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
        struct RangeTestDataConfig {
            let range: Range<Int>
            let lowerBond: Int
            let upperBond: Int
        }

        struct CloseRangeTestDataConfig {
            let range: ClosedRange<Int>
            let lowerBond: Int
            let upperBond: Int
        }


        let rangeTestData = [
            RangeTestDataConfig(range: 0..<100, lowerBond: 0, upperBond: 100),
            RangeTestDataConfig(range: 0..<1, lowerBond: 0, upperBond: 1)
        ]

        let closeRangeTestData = [
            CloseRangeTestDataConfig(range: 0...100, lowerBond: 0, upperBond: 100),
            CloseRangeTestDataConfig(range: 0...1, lowerBond: 0, upperBond: 1)
        ]

        rangeTestData.forEach { testData in
            describe("Int has a number of extentions to generate random value") {
                context("When 'random' method is called with \(testData.range) range specified") {
                    it("Should generate random number in that range excluding upper bond") {
                        (0...100).forEach { _ in
                            let randomNumber = Int.random(testData.range)
                            expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                            expect(randomNumber).to(beLessThan(testData.upperBond))
                        }
                    }
                }
            }

            closeRangeTestData.forEach { testData in
                context("When 'random' method is called with \(testData.range) closed range specified") {
                    it("Should generate random number in that range including upper bond") {
                        (0...100).forEach { _ in
                            let randomNumber = Int.random(testData.range)
                            expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                            expect(randomNumber).to(beLessThanOrEqualTo(testData.upperBond))
                        }

                    }
                }

                context("When 'random' method is called with \(testData.lowerBond) lower, \(testData.upperBond) upper bond specified") {
                    it("Should generate random number in that range") {
                        (0...100).forEach { _ in
                            let randomNumber = Int.random(between: testData.lowerBond, and: testData.upperBond)
                            expect(randomNumber).to(beGreaterThanOrEqualTo(testData.lowerBond))
                            expect(randomNumber).to(beLessThanOrEqualTo(testData.upperBond))
                        }
                    }
                }
            }

            rangeTestData.forEach { testData in
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
                }
            }
        }
    }
}
