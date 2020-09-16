//
//  OnboardCellViewModel.swift
//  paysplit
//
//  Created by timofey makhlay on 5/9/20.
//  Copyright © 2020 dev. All rights reserved.
//

import UIKit

class OnboardCellViewModel {
    let centerImgage: UIImage
    let descriptionText: String
    
    init(centerImageText: String, descriptionText: String, isGifBool: Bool) {
        if isGifBool == false {
            // forced because we hard code the names (can't fail)
            centerImgage = UIImage(named: centerImageText)!
        } else {
            // Convert gif to UIImage
            let imageData = try? Data(contentsOf: Bundle.main.url(forResource: centerImageText, withExtension: "gif")!)
            let advTimeGif = UIImage.gifImageWithData(imageData!)
            centerImgage = advTimeGif!
            
        }
        self.descriptionText = descriptionText
    }
}
