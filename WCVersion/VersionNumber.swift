//
// Created by Woraphot Chokratanasombat on 31/8/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation
import WCExtensions

class VersionNumber {
    let version: String
    let MAJOR: Int
    let MINOR: Int
    let PATCH: Int

    init(_ version: String) {
        self.version = version

        let match = PATTERN.matches(self.version).first
        MAJOR = VersionNumber.partFor(self.version, match: match, at: 1)
        MINOR = VersionNumber.partFor(self.version, match: match, at: 3)
        PATCH = VersionNumber.partFor(self.version, match: match, at: 5)
    }

    /////////////////
    // Version Parser
    /////////////////
    private static func partFor(_ version: String, match: NSTextCheckingResult?, at: Int) -> Int {
        guard let match = match else {
            return 0
        }
        if match.numberOfRanges <= at {
            return 0
        }
        let range = match.range(at: at)
        if range.length == 0 {
            return 0
        }

        return Int(version[range.lowerBound..<range.upperBound]) ?? 0
    }
    private let PATTERN = Regex("^(\\d+)(\\.(\\d+))?(\\.(\\d+))?$")
}

////////////////////////
// Compare VersionNumber
////////////////////////
extension VersionNumber : Comparable {
    static func < (lhs: VersionNumber, rhs: VersionNumber) -> Bool {
        if lhs.MAJOR > rhs.MAJOR {
            return false
        }
        if lhs.MINOR > rhs.MINOR {
            return false
        }
        return lhs.PATCH < rhs.PATCH
    }
    
    static func == (lhs: VersionNumber, rhs: VersionNumber) -> Bool {
        return lhs.MAJOR == rhs.MAJOR && lhs.MINOR == rhs.MINOR && lhs.PATCH == rhs.PATCH
    }

    static func > (lhs: VersionNumber, rhs: VersionNumber) -> Bool {
        if lhs.MAJOR < rhs.MAJOR {
            return false
        }
        if lhs.MINOR < rhs.MINOR {
            return false
        }
        return lhs.PATCH > rhs.PATCH
    }
}
