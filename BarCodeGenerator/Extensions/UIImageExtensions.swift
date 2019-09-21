//
//  UIImageExtensions.swift
//  BarCodeGenerator
//
//  Created by Mu-Sonic on 21/09/2019.
//  Copyright © 2019 Mu-Sonic. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init?(barcode type: CodeType, for string: String) {
        guard let data = string.data(using: .ascii),
            let filter = CIFilter(name: type.descriptor) else {
                return nil
        }
        
        filter.setValue(data, forKey: "inputMessage")
        guard let ciImage = filter.outputImage else {
            return nil
        }
        
        // scale image to make it sharper
        let imageSize = ciImage.extent.size
        let target = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        let ratio = target / imageSize.width
        let transform = CGAffineTransform(scaleX: ratio, y: ratio)
        let scaledImage = ciImage.transformed(by: transform)
        
        // we need to convert to CGImage first, otherwise UIImage won't respect contentMode
        guard let cgImage = CIContext(options: nil).createCGImage(scaledImage, from: scaledImage.extent) else {
            return nil
        }

        self.init(cgImage: cgImage)
    }
}
