//
// Created by Woraphot Chokratanasombat on 31/8/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation
import WCExtensions

public class VersionNumber {
    let version: String
    let MAJOR: Int
    let MINOR: Int
    let PATCH: Int

    public init(_ version: String) {
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
        guard let match = match else { return 0 }
        guard at < match.numberOfRanges else { return 0 }
        let range = match.range(at: at)
        guard range.length > 0 else { return 0 }

        return Int(version[range.lowerBound..<range.upperBound]) ?? 0
    }
    private let PATTERN = Regex("^(\\d+)(\\.(\\d+))?(\\.(\\d+))?$")
}

////////////////////////
// Compare VersionNumber
////////////////////////
extension VersionNumber : Comparable {
    public static func < (lhs: VersionNumber, rhs: VersionNumber) -> Bool {
        guard lhs.MAJOR == rhs.MAJOR else { return lhs.MAJOR < rhs.MAJOR }
        guard lhs.MINOR == rhs.MINOR else { return lhs.MINOR < rhs.MINOR }
        
        return lhs.PATCH < rhs.PATCH
    }

    public static func == (lhs: VersionNumber, rhs: VersionNumber) -> Bool {
        return lhs.MAJOR == rhs.MAJOR && lhs.MINOR == rhs.MINOR && lhs.PATCH == rhs.PATCH
    }

    public static func > (lhs: VersionNumber, rhs: VersionNumber) -> Bool {
        guard lhs.MAJOR == rhs.MAJOR else { return lhs.MAJOR > rhs.MAJOR }
        guard lhs.MINOR == rhs.MINOR else { return lhs.MINOR > rhs.MINOR }
        
        return lhs.PATCH > rhs.PATCH
    }
}
