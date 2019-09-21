//
//  BarCodeProvider.swift
//  BarCodeGenerator
//
//  Created by Mu-Sonic on 21/09/2019.
//  Copyright © 2019 Mu-Sonic. All rights reserved.
//

import UIKit

class BarCodeProvider {
    private let stringProvider: StringProvider
    private var codeType: CodeType = .code128
    private let queue = DispatchQueue(label: "com.mu-sonic.BarCodeGenerator")

    init(stringProvider: StringProvider) {
        self.stringProvider = stringProvider
    }
    
    private func generateBarCode() -> UIImage? {
        let string = self.stringProvider.generateString()
        let barcode = UIImage(barcode: self.codeType, for: string)
        return barcode
    }
}

extension BarCodeProvider: ImageProvider {
    func generateImage(completion: @escaping (UIImage?)->Void) {
        queue.async {
            let image = self.generateBarCode()
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}

extension BarCodeProvider: CodeTypeSelector {
    var currentType: CodeType {
        return codeType
    }
    
    func previous() {
        codeType = codeType.previous
    }
    
    func next() {
        codeType = codeType.next
    }
}
