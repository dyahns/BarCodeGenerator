//
//  ImageProvider.swift
//  BarCodeGenerator
//
//  Created by Mu-Sonic on 21/09/2019.
//  Copyright © 2019 Mu-Sonic. All rights reserved.
//

import UIKit

protocol ImageProvider {
    func generateImage(completion: @escaping (UIImage?)->Void)
}
