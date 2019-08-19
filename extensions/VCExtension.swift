//
//  VCextension.swift
//  UILabelinDeep
//
//  Created by eduardo fulgencio on 16/08/2019.
//  Copyright © 2019 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // Método para situar controles
    // pasar en nuevo, el que estará en la parte superior
    // UILabel extiende de UIView pero el UIButton de UIControl
    func situationControl(objectVisual: AnyObject, aboveControl: AnyObject) {
        if let newView = (objectVisual as? UIView), objectVisual is UIView {
                newView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    newView.topAnchor.constraint(equalTo: aboveControl.bottomAnchor, constant: 20),
                    newView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
                    newView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
                    newView.heightAnchor.constraint(equalToConstant: 30)
                    ])
        } else if let newControl = (objectVisual as? UIControl), objectVisual is UIControl  {
                newControl.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    newControl.topAnchor.constraint(equalTo: aboveControl.bottomAnchor, constant: 10),
                    newControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
                    newControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
                    newControl.heightAnchor.constraint(equalToConstant: 30)
                    ])
        }
    }
 
}
