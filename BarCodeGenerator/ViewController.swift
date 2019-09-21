//
//  ViewController.swift
//  BarCodeGenerator
//
//  Created by Mu-Sonic on 21/09/2019.
//  Copyright © 2019 Mu-Sonic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var tap: UITapGestureRecognizer!
    var imageProvider: ImageProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = nil
        configureImageProvider()
        configureGestures()
    }

    private func configureImageProvider() {
        imageProvider = BarCodeProvider(stringProvider: RandomStringGenerator())
    }
    
    private func configureGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(requestUpdate))
        view.addGestureRecognizer(tap)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(switchCodeType))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)

        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(switchCodeType))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
    }
    
    @objc private func requestUpdate() {
        imageProvider?.generateImage { (image) in
            guard let image = image else {
                self.imageView.image = nil
                self.titleLabel.text = nil
                self.displayError(message: "Failed to generate barcode!")
                return
            }
            
            self.imageView.image = image
            self.updateTitle()
        }
    }
    
    @objc private func switchCodeType(recogniser: UISwipeGestureRecognizer) {
        guard let selector = imageProvider as? CodeTypeSelector else {
            return
        }
        
        switch recogniser.direction {
        case .left:
            selector.previous()
        case .right:
            selector.next()
        default:
            return
        }
        
        requestUpdate()
    }

    private func updateTitle() {
        let selector = imageProvider as? CodeTypeSelector
        titleLabel.text = selector?.currentType.title
    }
}
