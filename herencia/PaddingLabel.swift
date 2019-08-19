//
//  PaddingLabel.swift
//  UIinDeep
//
//  Created by eduardo fulgencio on 18/08/2019.
//  Copyright © 2019 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

//let label = PaddingLabel(8, 8, 16, 16)
//label.font = .boldSystemFont(ofSize: 16)
//label.text = "Hello World"
//label.backgroundColor = .black
//label.textColor = .white
//label.textAlignment = .center
//label.layer.cornerRadius = 8
//label.clipsToBounds = true
//label.sizeToFit()
//
//view.addSubview(label)

// Otra manera
//Adding space/padding to a UILabel
//@IBDesignable class PaddingLabel: UILabel {
//
//    @IBInspectable var topInset: CGFloat = 5.0
//    @IBInspectable var bottomInset: CGFloat = 5.0
//    @IBInspectable var leftInset: CGFloat = 7.0
//    @IBInspectable var rightInset: CGFloat = 7.0
//
//    override func drawText(in rect: CGRect) {
//        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
//        super.drawText(in: rect.inset(by: insets))
//    }
//
//    override var intrinsicContentSize: CGSize {
//        let size = super.intrinsicContentSize
//        return CGSize(width: size.width + leftInset + rightInset,
//                      height: size.height + topInset + bottomInset)
//    }
//}

class PaddingLabel: UILabel {

    var topInset: CGFloat
    var bottomInset: CGFloat
    var leftInset: CGFloat
    var rightInset: CGFloat

    required init(withInsets top: CGFloat, _ bottom: CGFloat,_ left: CGFloat,_ right: CGFloat) {
        self.topInset = top
        self.bottomInset = bottom
        self.leftInset = left
        self.rightInset = right
        super.init(frame: CGRect.zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: self.frame.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }
}
