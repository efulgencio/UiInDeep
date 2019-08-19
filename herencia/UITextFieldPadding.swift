//
//  TextFieldPadding.swift
//  UITextFieldInDeep
//
//  Created by eduardo fulgencio on 15/08/2019.
//  Copyright © 2019 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

class UITextFieldPadding : UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
