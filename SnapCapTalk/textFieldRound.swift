//
//  textFieldRound.swift
//  SnapCapTalk
//
//  Created by Dmytro Aprelenko on 13.04.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class RoundTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var bgColor: UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            if let rawString = attributedPlaceholder?.string {
                let str = NSAttributedString(string: rawString, attributes: [NSForegroundColorAttributeName: placeholderColor!])
                attributedPlaceholder = str
        }
            
        }
    }
    
}
