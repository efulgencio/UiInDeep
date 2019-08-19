//
//  StringExtension.swift
//  UIinDeep
//
//  Created by eduardo fulgencio on 18/08/2019.
//  Copyright © 2019 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

extension String {
    static func formatAttributed(strings: [String],
                                 boldFont: UIFont = UIFont.boldSystemFont(ofSize: 14),
                                 boldColor: UIColor = UIColor.blue,
                                 inString string: String,
                                 font: UIFont = UIFont.systemFont(ofSize: 14),
                                 color: UIColor = UIColor.black) -> NSAttributedString {
        
        let attributedString = NSMutableAttributedString(string: string, attributes: [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color])
        
        let boldFontAttribute = [NSAttributedString.Key.font: boldFont, NSAttributedString.Key.foregroundColor: boldColor]
        
        for bold in strings {
            attributedString.addAttributes(boldFontAttribute, range: (string as NSString).range(of: bold))
        }
        
        return attributedString
    }
}
