//
//  Label_Extension.swift
//  UILabelinDeep
//
//  Created by eduardo fulgencio on 11/08/2019.
//  Copyright © 2019 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    
    func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor) {
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : oulineColor,
            NSAttributedString.Key.foregroundColor : foregroundColor,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : self.font as Any] as [NSAttributedString.Key : Any]
        
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
    
    func underline() {
        if let textString = self.text {
             // inicializa attributed text con un string
            let attributedString = NSMutableAttributedString(string: textString)
            // y al attributed text se le añaden attributos
            attributedString.addAttribute(
                NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue,
                range: NSRange(location: 0, length: attributedString.length))
            
            // y a la propiedad attributed text le aplico el attributed string
            attributedText = attributedString
        }
    }
    
    func indexOfAttributedTextCharacterAtPoint(point: CGPoint) -> Int {
        
        assert(self.attributedText != nil, "This method is developed for attributed string")
        
        let textStorage = NSTextStorage(attributedString: self.attributedText!)
        let layoutManager = NSLayoutManager()
        
        textStorage.addLayoutManager(layoutManager)
        
        let textContainer = NSTextContainer(size: self.frame.size)
        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = self.numberOfLines
        textContainer.lineBreakMode = self.lineBreakMode
        layoutManager.addTextContainer(textContainer)
        
        let index = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return index
    }
    
}
