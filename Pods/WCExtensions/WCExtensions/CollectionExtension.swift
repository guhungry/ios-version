//
//  ArrayExtension.swift
//  WCExtensions
//
//  Created by Woraphot Chokratanasombat on 4/9/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

public extension Collection where Index == Int {
    public func getOrNull(_ position: Int) -> Element?  {
        guard position < count else { return nil }
        return self[position]
    }
}

public extension Collection {
    public func forEachIndexed(_ action: (Int, Element) -> Void) {
        for (index, element) in lazy.enumerated() {
            action(index, element)
        }
    }
}
