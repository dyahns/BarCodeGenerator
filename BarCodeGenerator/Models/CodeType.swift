//
//  CodeType.swift
//  BarCodeGenerator
//
//  Created by Mu-Sonic on 21/09/2019.
//  Copyright © 2019 Mu-Sonic. All rights reserved.
//

import Foundation

enum CodeType {
    case code128
    case pdf417
    case aztec
    case qr
    
    var descriptor: String {
        switch self {
        case .code128:
            return "CICode128BarcodeGenerator"
        case .pdf417:
            return "CIPDF417BarcodeGenerator"
        case .aztec:
            return "CIAztecCodeGenerator"
        case .qr:
            return "CIQRCodeGenerator"
        }
    }
    
    var title: String {
        switch self {
        case .code128:
            return "128 Barcode"
        case .pdf417:
            return "PDF417 Barcode"
        case .aztec:
            return "Aztec Code"
        case .qr:
            return "QR Code"
        }
    }
    
    var next: CodeType {
        return getNeighbourType(1)
    }
    
    var previous: CodeType {
        return getNeighbourType(-1)
    }
    
    private func getNeighbourType(_ shift: Int) ->  CodeType {
        let all = CodeType.all
        let index = all.firstIndex(of: self) ?? 0
        return all[(index + all.count + shift) % all.count]
    }
    
    static let all: [CodeType] = [.code128, .pdf417, .aztec, .qr]
}
