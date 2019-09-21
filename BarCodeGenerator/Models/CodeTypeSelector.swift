//
//  CodeTypeSelector.swift
//  BarCodeGenerator
//
//  Created by Mu-Sonic on 21/09/2019.
//  Copyright © 2019 Mu-Sonic. All rights reserved.
//

import Foundation

protocol CodeTypeSelector {
    var currentType: CodeType { get }
    func next()
    func previous()
}
