/*
 * ArrayExtentionTests.swift
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

