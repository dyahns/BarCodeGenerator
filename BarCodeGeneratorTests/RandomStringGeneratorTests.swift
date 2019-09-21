//
//  RandomStringGeneratorTests.swift
//  BarCodeGeneratorTests
//
//  Created by Mu-Sonic on 21/09/2019.
//  Copyright © 2019 Mu-Sonic. All rights reserved.
//

import XCTest
@testable import BarCodeGenerator

class RandomStringGeneratorTests: XCTestCase {
    let generator = RandomStringGenerator()
    
    func testGeneratorReturnsNonEmptyString() {
        let string = generator.generateString()
        XCTAssert(!string.isEmpty)
    }
    
    func testGeneratorReturnsNewString() {
        let string1 = generator.generateString()
        let string2 = generator.generateString()
        XCTAssert(string1 != string2)
    }
}
