/*
 * ArraySliceExtensionTest.swift
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