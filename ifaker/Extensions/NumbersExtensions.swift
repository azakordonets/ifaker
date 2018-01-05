/*
 * NumbersExtensions.swift
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

public extension Int {

    public static func random(_ range: Range<Int>) -> Int {
#if swift(>=3)
        return random(between: range.lowerBound, and: range.upperBound - 1)
#else
        return random(range.upperBound, range.lowerBound)
#endif
    }

    public static func random(_ range: ClosedRange<Int>) -> Int {
        return random(between: range.lowerBound, and: range.upperBound)
    }

    public static func random(between lower: Int = 0, and upper: Int = 100) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}

public extension Int32 {
    /// SwiftRandom extension
    public static func random(_ range: Range<Int>) -> Int32 {
        return random(between: range.lowerBound, and: range.upperBound)
    }

    /// SwiftRandom extension
    ///
    /// - note: Using `Int` as parameter type as we usually just want to write `Int32.random(13, 37)` and not `Int32.random(Int32(13), Int32(37))`
    public static func random(between lower: Int = 0, and upper: Int = 100) -> Int32 {
        let r = arc4random_uniform(UInt32(Int64(upper) - Int64(lower)))
        return Int32(Int64(r) + Int64(lower))
    }
}