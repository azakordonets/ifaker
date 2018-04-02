import Foundation

public extension Bool {
    public static func random() -> Bool {
        return Int.random() % 2 == 0
    }
}
