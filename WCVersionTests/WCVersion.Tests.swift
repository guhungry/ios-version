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

class WCVersionTests: XCTestCase {
    var sut: VersionNumber!
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func testParseVersion_WhenValueIs1_VersionShouldBe100() {
        sut = VersionNumber("1")
        
        assertThat(sut.version, equalTo("1"))
        assertThat(sut.major, equalTo(1))
        assertThat(sut.minor, equalTo(0))
        assertThat(sut.patch, equalTo(0))
    }
    
    func testParseVersion_WhenValueIs32_VersionShouldBe320() {
        sut = VersionNumber("3.2")
        
        assertThat(sut.version, equalTo("3.2"))
        assertThat(sut.major, equalTo(3))
        assertThat(sut.minor, equalTo(2))
        assertThat(sut.patch, equalTo(0))
    }
    
    func testParseVersion_WhenValueIs1131_VersionShouldBe1131() {
        sut = VersionNumber("11.3.1")
        
        assertThat(sut.version, equalTo("11.3.1"))
        assertThat(sut.major, equalTo(11))
        assertThat(sut.minor, equalTo(3))
        assertThat(sut.patch, equalTo(1))
    }
    
    func testParseVersion_WhenValueIsInvalid_VersionShouldBe000() {
        sut = VersionNumber("Invalid")
        
        assertThat(sut.version, equalTo("Invalid"))
        assertThat(sut.major, equalTo(0))
        assertThat(sut.minor, equalTo(0))
        assertThat(sut.patch, equalTo(0))
    }
}
