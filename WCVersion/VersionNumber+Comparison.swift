//
// Created by Woraphot Chokratanasombat on 31/8/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

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
