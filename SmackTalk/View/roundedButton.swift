//
//  roundedButton.swift
//  SmackTalk
//
//  Created by Evan on 7/24/17.
//  Copyright © 2017 Evan Laird. All rights reserved.
//

import UIKit

@IBDesignable
class roundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }

    

}
