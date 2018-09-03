//
//  WCVersionTests.swift
//  WCVersionTests
//
//  Created by Woraphot Chokratanasombat on 3/9/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import XCTest
import Hamcrest
@testable import WCVersion

class WCVersionComparableTests: XCTestCase {
    var sut1: VersionNumber!
    var sut2: VersionNumber!
    
    override func tearDown() {
        sut1 = nil
        sut2 = nil
        
        super.tearDown()
    }
    
    func testCompare_With452_123_ShouldCompareCorrectly() {
        sut1 = VersionNumber("4.5.2")
        sut2 = VersionNumber("1.2.3")
        
        assertThat(sut1 > sut2, equalTo(true))
        assertThat(sut1 < sut2, equalTo(false))
        assertThat(sut1 == sut2, equalTo(false))
        
        assertThat(sut2 > sut1, equalTo(false))
        assertThat(sut2 < sut1, equalTo(true))
        assertThat(sut2 == sut1, equalTo(false))
    }
    
    func testCompare_With678_632_ShouldCompareCorrectly() {
        sut1 = VersionNumber("6.7.8")
        sut2 = VersionNumber("6.3.2")
        
        assertThat(sut1 > sut2, equalTo(true))
        assertThat(sut1 < sut2, equalTo(false))
        assertThat(sut1 == sut2, equalTo(false))
        
        assertThat(sut2 > sut1, equalTo(false))
        assertThat(sut2 < sut1, equalTo(true))
        assertThat(sut2 == sut1, equalTo(false))
    }
    
    func testCompare_With783_781_ShouldCompareCorrectly() {
        sut1 = VersionNumber("7.8.3")
        sut2 = VersionNumber("7.8.1")
        
        assertThat(sut1 > sut2, equalTo(true))
        assertThat(sut1 < sut2, equalTo(false))
        assertThat(sut1 == sut2, equalTo(false))
        
        assertThat(sut2 > sut1, equalTo(false))
        assertThat(sut2 < sut1, equalTo(true))
        assertThat(sut2 == sut1, equalTo(false))
    }
    
    func testCompare_With555_555_ShouldCompareCorrectly() {
        sut1 = VersionNumber("5.5.5")
        sut2 = VersionNumber("5.5.5")
        
        assertThat(sut1 > sut2, equalTo(false))
        assertThat(sut1 < sut2, equalTo(false))
        assertThat(sut1 == sut2, equalTo(true))
        
        assertThat(sut2 > sut1, equalTo(false))
        assertThat(sut2 < sut1, equalTo(false))
        assertThat(sut2 == sut1, equalTo(true))
    }
}
