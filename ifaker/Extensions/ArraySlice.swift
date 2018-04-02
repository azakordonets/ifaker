

import Foundation

public extension ArraySlice {

    public func randomItem() -> Element? {
        guard self.count > 0 else {
            return nil
        }

#if swift(>=3)
        let index = Int.random(between: self.startIndex, and: self.endIndex - 1)
#else
        let index = Int.random(from: self.startIndex, until: self.endIndex)
#endif
        return self[index]
    }
}