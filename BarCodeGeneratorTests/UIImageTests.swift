//
//  UIImageTests.swift
//  BarCodeGeneratorTests
//
//  Created by Mu-Sonic on 21/09/2019.
//  Copyright © 2019 Mu-Sonic. All rights reserved.
//

import XCTest
@testable import BarCodeGenerator

class UIImageTests: XCTestCase {
    func testBarcodeNotNilFromNonEmptyString() {
        let barcode = UIImage(barcode: .code128, for: "???")
        XCTAssertNotNil(barcode)
    }
}
