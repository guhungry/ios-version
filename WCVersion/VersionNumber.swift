//
// Created by Woraphot Chokratanasombat on 31/8/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation
import WCExtensions

/// Represent version number in major(.minor)?(.patch)? format
///
///     let version1 = VersionNumber("1.2.4")
///     let version2 = VersionNumber("2.1.5")
///     print(version1 > version2)
public class VersionNumber {
    let version: String
    let major: Int
    let minor: Int
    let patch: Int

    /// - Parameter version: version string in major(.minor)?(.patch)? format
    public init(_ version: String) {
        self.version = version

        let match = VersionNumber.pattern.matches(self.version).first
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
    private static let pattern = Regex("^(\\d+)(\\.(\\d+))?(\\.(\\d+))?$")
}
