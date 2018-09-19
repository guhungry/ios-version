//
// Created by Woraphot Chokratanasombat on 31/8/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation
import WCExtensions

public class VersionNumber {
    let version: String
    let major: Int
    let minor: Int
    let patch: Int

    public init(_ version: String) {
        self.version = version

        let match = VersionNumber.PATTERN.matches(self.version).first
        major = VersionNumber.partFor(self.version, match: match, at: 1)
        minor = VersionNumber.partFor(self.version, match: match, at: 3)
        patch = VersionNumber.partFor(self.version, match: match, at: 5)
    }

    /////////////////
    // Version Parser
    /////////////////
    private static func partFor(_ version: String, match: NSTextCheckingResult?, at: Int) -> Int {
        guard let match = match else { return 0 }
        let range = match.range(at: at)
        guard range.length > 0 else { return 0 }

        return version[range.lowerBound..<range.upperBound].toInt(or: 0)
    }
    private static let PATTERN = Regex("^(\\d+)(\\.(\\d+))?(\\.(\\d+))?$")
}

////////////////////////
// Compare VersionNumber
////////////////////////
extension VersionNumber : Comparable {
    public static func < (lhs: VersionNumber, rhs: VersionNumber) -> Bool {
        guard lhs.major == rhs.major else { return lhs.major < rhs.major
        }
        guard lhs.minor == rhs.minor else { return lhs.minor < rhs.minor
        }
        
        return lhs.patch < rhs.patch
    }

    public static func == (lhs: VersionNumber, rhs: VersionNumber) -> Bool {
        return lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch == rhs.patch
    }

    public static func > (lhs: VersionNumber, rhs: VersionNumber) -> Bool {
        guard lhs.major == rhs.major else { return lhs.major > rhs.major
        }
        guard lhs.minor == rhs.minor else { return lhs.minor > rhs.minor
        }
        
        return lhs.patch > rhs.patch
    }
}
