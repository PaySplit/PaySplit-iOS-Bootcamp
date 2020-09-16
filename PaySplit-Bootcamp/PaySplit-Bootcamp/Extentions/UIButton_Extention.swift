//
//  UIButton_Extention.swift
//  paysplit
//
//  Created by timofey makhlay on 4/10/20.
//  Copyright © 2020 dev. All rights reserved.
//

import UIKit

extension UIButton {
    /// Custom Function to scale button down and up when first touchedDown
    func touchDown() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95)
        }, completion: { (finish) in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.identity
            })
        })
    }
    
    /// Custom function run after touchDown function to vibrate on successful press.
    func touchUp() {
        Vibration.success.vibrate()
    }

    /// Custom function when there's an error
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.05
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
        Vibration.error.vibrate()
    }
}

