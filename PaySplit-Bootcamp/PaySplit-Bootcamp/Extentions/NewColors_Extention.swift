//
//  NewColors_Extention.swift
//  paysplit
//
//  Created by timofey makhlay on 9/5/20.
//  Copyright © 2020 dev. All rights reserved.
//

import UIKit

// MARK: New Color Extenstion
///
/**
 PaySplit's  V2.5 Color Palette
 
Colors:
 - Primary
 - Primary2
 - Secondary
 - Background
 - Gray
 - Light
 - White
 - Success
 - Error
 - PrimaryGradient
 - SecondaryGradient
 
 ~~~
 //  UIColor
 let white = Color.white.value
 
 // CGColor
 let pink = Color.pink.value.cgColor
 
 
 // CAGradientLayer
 let gradient: CAGradientLayer = Color.white.gradientBackground() // Call function
 
 gradient.frame = view.bounds // set bounds
 view.layer.insertSublayer(gradient, at: 0) // add to view
 ~~~
 */
enum PSColor {
    // Main
    case primary
    case primary2
    case secondary
    case background
    
    // Additional
    case gray
    case light
    case white
    case success
    case error
    
    // Hex to UIColor
    case custom(hexString: String, alpha: Double)
    
    /// Provide two UIColors and return a CAGradientLayer
    func setCustomGradient(colorTop: UIColor, colorBottom: UIColor) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        return gradientLayer
        // MARK: Gradient Layer
        // gradientLayer.frame = view.bounds
        // view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /**
     The gradient to make `Blue` CAGradientLayer() instance.

     ~~~
     // Instance
     let gradient: CAGradientLayer = Color.white.primaryGradient() // Call function
     
     gradient.frame = view.bounds // set bounds
     view.layer.insertSublayer(gradient, at: 0) // add to view
     ~~~
     */
    func primaryGradient() -> CAGradientLayer {
        return setCustomGradient(colorTop: #colorLiteral(red: 0, green: 0.4, blue: 1, alpha: 1), colorBottom: #colorLiteral(red: 0.09803921569, green: 0.7490196078, blue: 0.9450980392, alpha: 1))
    }
    
    /**
     The gradient to make `Light blue` CAGradientLayer() instance.

     ~~~
     // Instance
     let gradient: CAGradientLayer = Color.white.secondaryGradient() // Call function
     
     gradient.frame = view.bounds // set bounds
     view.layer.insertSublayer(gradient, at: 0) // add to view
     ~~~
     */
    func secondaryGradient() -> CAGradientLayer {
        return setCustomGradient(colorTop: #colorLiteral(red: 0.09803921569, green: 0.7490196078, blue: 0.9450980392, alpha: 1), colorBottom: #colorLiteral(red: 0.4235294118, green: 0.9058823529, blue: 1, alpha: 1))
    }
    
    /**
     The gradient to make `Background` CAGradientLayer() instance.

     ~~~
     // Instance
     let gradient: CAGradientLayer = Color.white.backgroundGradient() // Call function
     
     gradient.frame = view.bounds // set bounds
     view.layer.insertSublayer(gradient, at: 0) // add to view
     ~~~
     */
    func backgroundGradient() -> CAGradientLayer {
        return setCustomGradient(colorTop: #colorLiteral(red: 0, green: 0.1058823529, blue: 0.1803921569, alpha: 1), colorBottom: #colorLiteral(red: 0.06666666667, green: 0.07450980392, blue: 0.2666666667, alpha: 1))
    }
    
    
     /**
     The gradient to make `White fade` CAGradientLayer() instance.
     
     ~~~
     // Instance
     let gradient: CAGradientLayer = Color.white.gradientBackground() // Call function
     
     gradient.frame = view.bounds // set bounds
     view.layer.insertSublayer(gradient, at: 0) // add to view
     ~~~
     */
    func gradientTransparentBackground() -> CAGradientLayer {
        return setCustomGradient(colorTop: #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9725490196, alpha: 0), colorBottom: #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9725490196, alpha: 1))
    }

    /// Change transparency of the color
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

extension PSColor {
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
        case .primary:
            instanceColor = UIColor(hexString: "#19BFF1")
        case .primary2:
            instanceColor = UIColor(hexString: "#5DFDCB")
        case .secondary:
            instanceColor = UIColor(hexString: "#111344")
        case .background:
            instanceColor = UIColor(hexString: "#001B2E")
        case .gray:
            instanceColor = UIColor(hexString: "#8C8A9A")
        case .light:
            instanceColor = UIColor(hexString: "#EAF7FA")
        case .white:
            instanceColor = UIColor(hexString: "#FFFFFF")
        case .success:
            instanceColor = UIColor(hexString: "#38C2B7")
        case .error:
            instanceColor = UIColor(hexString: "#E14161")
        }
        return instanceColor
    }
}

// Need this for the colors to work.
extension UIColor {
    /**
     Creates an UIColor from HEX String in "#363636" format
     
     - parameter hexString: HEX String in "#363636" format
     - returns: UIColor from HexString
     */
    convenience init(hexString: String) {
        
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner          = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    /**
     Creates an UIColor Object based on provided RGB value in integer
     - parameter red:   Red Value in integer (0-255)
     - parameter green: Green Value in integer (0-255)
     - parameter blue:  Blue Value in integer (0-255)
     - returns: UIColor with specified RGB values
     */
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}
