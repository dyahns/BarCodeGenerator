//
//  CodeTypeTests.swift
//  BarCodeGeneratorTests
//
//  Created by Mu-Sonic on 21/09/2019.
//  Copyright © 2019 Mu-Sonic. All rights reserved.
//

import XCTest
@testable import BarCodeGenerator

class CodeTypeTests: XCTestCase {

    func testNextReturnsNext() {
        let type = CodeType.code128
        XCTAssertEqual(type.next, .pdf417)
    }

    func testPreviousReturnsPrevious() {
        let type = CodeType.qr
        XCTAssertEqual(type.previous, .aztec)
    }

    func testAtEndNextReturnsFirst() {
        let type = CodeType.qr
        XCTAssertEqual(type.next, CodeType.all.first)
    }
    
    func testAtStartPreviousReturnsLast() {
        let type = CodeType.code128
        XCTAssertEqual(type.previous, CodeType.all.last)
    }
}
