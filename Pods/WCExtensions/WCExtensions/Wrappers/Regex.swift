//
// Created by Woraphot Chokratanasombat on 31/8/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

public class Regex {
    private let regex: NSRegularExpression?

    public convenience init(_ pattern: String) {
        self.init(pattern, options: [])
    }

    init(_ pattern: String, options: NSRegularExpression.Options) {
        regex = try? NSRegularExpression(pattern: pattern, options: options)
    }

    public func matches(_ string: String) -> [NSTextCheckingResult] {
        return regex?.matches(in: string, options: [], range: NSMakeRange(0, string.count)) ?? []
    }
}
