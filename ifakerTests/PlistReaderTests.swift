/*
 * PlistReaderTests.swift
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

class PlistReaderTests: QuickSpec {
    override func spec() {
        describe("Plist reader allows us to read test data from plist for further usage") {
            context("When in words.plist i try to search for 'words' array") {
                it("Should return an array of words") {
                    guard let wordsArray = PlistReader.getValue(of: "words", from: "words", as: [String].self) else {
                        return
                    }
                    expect(wordsArray).notTo(beNil())
                    expect(wordsArray.count).to(beGreaterThan(0))

                }
            }
        }
    }
}