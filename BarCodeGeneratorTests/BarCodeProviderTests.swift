//
//  BarCodeProviderTests.swift
//  BarCodeGeneratorTests
//
//  Created by Mu-Sonic on 21/09/2019.
//  Copyright © 2019 Mu-Sonic. All rights reserved.
//

import XCTest
@testable import BarCodeGenerator

class BarCodeProviderTests: XCTestCase {
    var provider: BarCodeProvider!

    override func setUp() {
        provider = BarCodeProvider(stringProvider: RandomStringGenerator())
    }
    
    func testProviderSwitchesTypes() {
        let codeType1 = provider.currentType
        provider.next()
        let codeType2 = provider.currentType
        provider.previous()
        let codeType3 = provider.currentType
        
        XCTAssertNotEqual(codeType1, codeType2)
        XCTAssertEqual(codeType1, codeType3)
    }
    
    func testProviderSuppliesConsumerWithImage() {
        let expectation = XCTestExpectation(description: "Provide consumer with image")

        provider.generateImage{ (image) in
            XCTAssertNotNil(image, "No image was generated.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
