//
//  UITextViewPadding.swift
//  UITextFieldInDeep
//
//  Created by eduardo fulgencio on 15/08/2019.
//  Copyright © 2019 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

class UITextViewPadding : UITextView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        textContainerInset = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
    }
}
