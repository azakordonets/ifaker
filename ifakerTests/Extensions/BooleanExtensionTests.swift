/*
 * BooleanExtensionTests.swift
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
