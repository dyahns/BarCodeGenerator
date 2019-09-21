//
//  RandomStringGenerator.swift
//  BarCodeGenerator
//
//  Created by Mu-Sonic on 21/09/2019.
//  Copyright © 2019 Mu-Sonic. All rights reserved.
//

import Foundation

struct RandomStringGenerator {
    func generateUUIDString() -> String {
        return UUID().uuidString
    }
}

extension RandomStringGenerator: StringProvider {
    func generateString() -> String {
        return generateUUIDString()
    }
}
