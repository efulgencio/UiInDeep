//
//  File.swift
//  UIButtonInDeep
//
//  Created by eduardo fulgencio on 15/08/2019.
//  Copyright © 2019 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
//    let button = UIButton(frame: frame)
//    button.zoomIn() // here the magic
//
    /**
     Simply zooming in of a view: set view scale to 0 and zoom to Identity on 'duration' time interval.
     
     - parameter duration: animation duration
     */
    func zoomIn(duration: TimeInterval = 0.2) {
        self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform.identity
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /**
     Simply zooming out of a view: set view scale to Identity and zoom out to 0 on 'duration' time interval.
     
     - parameter duration: animation duration
     */
    func zoomOut(duration: TimeInterval = 0.2) {
        self.transform = CGAffineTransform.identity
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /**
     Zoom in any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomInWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        
        UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        }, completion: { (completed: Bool) -> Void in
            UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                self.transform = CGAffineTransform.identity
            }, completion: { (completed: Bool) -> Void in
            })
        })
    }
    
    /**
     Zoom out any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomOutWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        
        UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        }, completion: { (completed: Bool) -> Void in
            UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            }, completion: { (completed: Bool) -> Void in
            })
        })
    }
    
    /*
     @IBAction func buttonTouchDown(_ sender: UIButton) {
     //Connected with Touch Down Action
     sender.animateButtonDown()
     }
     
     @IBAction func buttonTouchUpOutside(_ sender: UIButton) {
     //Connected with Touch Up Outside Action
     //if touch moved away from button
     sender.animateButtonUp()
     }
     
     @IBAction func buttonTouchUpInside(_ sender: UIButton) {
     //Connected with Touch Up Inside Action
     sender.animateButtonUp()
     //code to execute when button pressed
     }
     
     Adding image-title padding is possible, but takes some trickiness with contentEdgeInsets, titleEdgeInsets, and imageEdgeInsets.
     
     contentEdgeInsets
     contentEdgeInsets is probably the easiest insets property to reason about. The insets apply padding to the content of the button, and they're taken into account in the button's instrinsicContentSize (which was what I expected).
     Positive values expand the button away from its content
     Negative values contract the button towards its content
     With negative contentEdgeInsets, it's possible to get the image and text to draw outside of the button's bounds.
     
     imageEdgeInsets
     imageEdgeInsets affects the drawing rect of the button's image, and does not figure into the button's intrinsicContentSize (this is different than contentEdgeInsets, which contributes to the intrinsicContentSize).
     Positive values contract the drawing rect towards the image's center
     Negative values expand the drawing rect away from the image's center
     Because imageEdgeInsets modifies the drawing rect, setting positive values can result in a squished image - with correct insets, you can actually flip the image! Negative values have the effect of translating the image, they expand the drawing rect back instead of contracting it.
     
     titleEdgeInsets
     titleEdgeInsets affects the drawing rect of the button's title, and like imageEdgeInsets does not contribute to the button's intrinsicContentSize.
     Positive values contract the drawing rect towards the center of the title
     Negative values expand the drawing rect away from the center of the title
     As the title's drawing rect compresses (i.e., as positive insets are added), letters get cut off with ellipses. As with imageEdgeInsets, negative values translate the text without otherwise affecting the button's layout.
     
     
     rounder a specific corner
     
     let redBox = UIView(frame: CGRect(x: 100, y: 100, width: 128, height: 128))
     redBox.backgroundColor = .red
     redBox.layer.cornerRadius = 25
     redBox.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
     view.addSubview(redBox)
     
 */
    func animateButtonDown() {
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: nil)
    }
    
    func animateButtonUp() {
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    
    
    
}
