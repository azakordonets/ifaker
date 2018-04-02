import Foundation
import UIKit


public extension Int {


    public static func random(_ range: CountableRange<Int>) -> Int {
#if swift(>=3)
        return random(between: range.lowerBound, and: range.upperBound - 1)
#else
        return random(range.upperBound, range.lowerBound)
#endif
    }

    public static func random(_ range: CountableClosedRange<Int>) -> Int {
        return random(between: range.lowerBound, and: range.upperBound)
    }

    public static func random(between lower: Int = 0, and upper: Int = 100) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}

public extension Int32 {


    /// iFaker public extension
    public static func random(_ range: CountableRange<Int>) -> Int32 {
#if swift(>=3)
        return self.random(between: range.lowerBound, and: range.upperBound - 1)
#else
        return random(range.upperBound, range.lowerBound)
#endif
    }

    /// iFaker public extension
    public static func random(_ range: CountableClosedRange<Int>) -> Int32 {
        return self.random(between: range.lowerBound, and: range.upperBound)
    }

    /// iFaker public extension
    /// - note: Using `Int` as parameter type as we usually just want to write `Int32.random(13, 37)` and not `Int32.random(Int32(13), Int32(37))`
    public static func random(between lower: Int = 0, and upper: Int = 100) -> Int32 {
        let r = arc4random_uniform(UInt32(Int64(upper) - Int64(lower)))
        return Int32(Int64(r) + Int64(lower))
    }
}

public extension Double {


    public static func random(_ range: Range<Double>) -> Double {
#if swift(>=3)
        return random(between: range.lowerBound, and: range.upperBound - 1)
#else
        return random(range.upperBound, range.lowerBound)
#endif
    }

    public static func random(_ range: ClosedRange<Double>) -> Double {
        return random(between: range.lowerBound, and: range.upperBound)
    }

    /// iFaker public extension
    public static func random(between lower: Double = 0, and upper: Double = 100) -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}


public extension Float {

    public static func random(_ range: Range<Float>) -> Float {
#if swift(>=3)
        return random(between: range.lowerBound, and: range.upperBound - 1)
#else
        return random(range.upperBound, range.lowerBound)
#endif
    }

    public static func random(_ range: ClosedRange<Float>) -> Float {
        return random(between: range.lowerBound, and: range.upperBound)
    }

    /// iFaker public extension
    public static func random(between lower: Float = 0, and upper: Float = 100) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}

public extension CGFloat {


    public static func random(_ range: Range<CGFloat>) -> CGFloat {
#if swift(>=3)
        return random(between: range.lowerBound, and: range.upperBound - 1)
#else
        return random(range.upperBound, range.lowerBound)
#endif
    }

    public static func random(_ range: ClosedRange<CGFloat>) -> CGFloat {
        return random(between: range.lowerBound, and: range.upperBound)
    }

    /// iFaker public extension
    public static func random(between lower: CGFloat = 0, and upper: CGFloat = 1) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (upper - lower) + lower
    }
}
