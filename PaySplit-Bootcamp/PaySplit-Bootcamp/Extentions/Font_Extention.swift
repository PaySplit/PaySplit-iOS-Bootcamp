//
//  Font_Extention.swift
//  paysplit
//
//  Created by timofey makhlay on 4/10/20.
//  Copyright © 2020 dev. All rights reserved.
//

import UIKit

// MARK: Font Extention
/**
 PaySplit's Font Extention
 
 - Font Sizes:
 - 14px - small
 - 16px - medium
 - 22px - large
 - 30px - title
 <br>
 
 
 - Font Names:
 - ExtraLight
 - Thin
 - Light
 - Regular
 - Medium
 - SemiBold
 - Bold
 - ExtraBold
 - Black
 
 Set font Size
 ~~~
 // Set font Size
 button.titleLabel?.font = UIFont.boldSystemFont(ofSize:  CGFloat(Font.medium.size))
 ~~~
 Set font Name
 ~~~
 // Set font Size
 title.font = UIFont(name: Font.semiBold.name, size: CGFloat(Font.large.size))
 ~~~
 */
enum Font {
    /// 14px
    case small
    
    /// 16px
    case medium
    
    /// 22px
    case large
    
    /// 30px
    case title
    
    case semiBold
    
    case regular
    
    case thin
    
    case bold
    
    case extraLight
    
    case light
    
    case extraBold
    
    case black
    
    var size: Double {
        var size = 0.0
        
        switch self {
        case .small:
            size = 14
        case .medium:
            size = 16
        case .large:
            size = 22
        case .title:
            size = 30
        case .semiBold: break
            
        case .regular: break
            
        case .thin: break
            
        case .bold: break
            
        case .extraLight: break
            
        case .light: break
            
        case .extraBold: break
            
        case .black: break
            
        }
        return size
    }
    
    var name: String {
        var fontName = ""
        
        switch self {
        case .small: break
        case .large: break
        case .title: break
            
        case .regular:
            fontName = "Poppins-Regular"
            
        case .thin:
            fontName = "Poppins-Thin"
            
        case .bold:
            fontName = "Poppins-Bold"
            
        case .medium:
            fontName = "Poppins-Medium"
            
        case .extraLight:
            fontName = "Poppins-ExtraLight"
            
        case .light:
            fontName = "Poppins-Light"
            
        case .semiBold:
            fontName = "Poppins-SemiBold"
            
        case .extraBold:
            fontName = "Poppins-ExtraBold"
            
        case .black:
            fontName = "Poppins-Black"
            
        }
        return fontName
    }
}

