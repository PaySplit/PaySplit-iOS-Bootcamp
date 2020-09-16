//
//  Padding_Extention.swift
//  paysplit
//
//  Created by timofey makhlay on 4/10/20.
//  Copyright © 2020 dev. All rights reserved.
//

import UIKit

// MARK: Padding Extention
///
/**
 PaySplit's Padding Scheme
 
 - Sizes:
 - 15px - consecutive
 - 24px - small
 - 40px - medium
 - 110px - large
 - 327px - largeButtonWidth
 - 48px - largeButtonHeight
 - 20px - smallButton
 - 200px - imageHeight
 
 ~~~
 // Image + Text in onboarding
 imageView.snp.makeConstraints { (make) in
 make.top.equalToSuperview().offset(Padding.large.value)
 make.centerX.equalToSuperview()
 make.height.equalTo(Padding.image.value * 1.5)
 }
 
 descriptionTextView.snp.makeConstraints { (make) in
 make.top.equalTo(imageView.snp.bottom).offset(Padding.large.value)
 make.right.equalToSuperview().offset(Padding.small.negative())
 make.left.equalToSuperview().offset(Padding.small.value)
 }
 ~~~
 */
enum Padding {
    /// 15px
    case consecutive
    
    /// 24px
    case small
    
    /// 40px
    case medium
    
    /// 110px
    case large
    
    /// 327px
    case largeButtonWidth
    
    /// 48px
    case largeButtonHeight
    
    /// 20px
    case smallButton
    
    /// 200px
    case imageHeight
    
    /// Print Screen Size Info
    func screenSizeInfo() {
        print("SCREEN SIZE\nHeight/:\(UIScreen.main.bounds.height)\nWidth:\(UIScreen.main.bounds.width)")
    }
    
    /// For the padding to be negative
    func negative() -> Double {
        return self.value * -1
    }
    
    /// For the padding to be negative
    func cgFloat() -> CGFloat {
        return CGFloat(self.value)
    }
}

extension Padding {
    var value: Double {
        var padding = 0.0
        let screenSize = UIScreen.main.bounds // if height 812px
        
        switch self {
        case .consecutive:
            padding = Double(screenSize.height / 54) // 15
        case .small:
            padding = Double(screenSize.height / 34) // 24
        case .medium:
            padding = Double(screenSize.height / 20) // 40
        case .large:
            padding = Double(screenSize.height / 7.5) // 110
        case .largeButtonWidth:
            padding = Double(screenSize.height / 2.5) // 327
        case .largeButtonHeight:
            padding = Double(screenSize.height / 17) // 48
        case .smallButton:
            padding = Double(screenSize.height / 40.6) // 20
        case .imageHeight:
            padding = Double(screenSize.height / 4.06) // 200
        }
        return padding
    }
    
}
