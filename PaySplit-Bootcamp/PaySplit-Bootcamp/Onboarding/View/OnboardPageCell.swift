//
//  PageCell.swift
//  paysplit
//
//  Created by Ruhsane Sawut on 12/11/19.
//  Copyright © 2019 dev. All rights reserved.
//

import UIKit

/// Holds Cell UI. Takes the data from Cell View Model
class OnboardPageCell: UICollectionViewCell {
    
    /// Cell identifier
    static var identifier = "Cell"
    
    /// Take the data from the viewmodel to put into the UI
    var onboardCellViewModel : OnboardCellViewModel? {
        didSet {
            imageView.image = onboardCellViewModel!.centerImgage
            descriptionTextView.text = onboardCellViewModel!.descriptionText
        }
    }
    
    /// THE IMAGE OR GIF IN THE MIDDLE FOR EACH CELL OF ONBOARDING
    let imageView: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.3
        v.layer.shadowOffset = CGSize(width: 1, height: 20)
        v.layer.shadowRadius = 10
        return v
    }()
    
    /// IPHONE FRAME
    let phoneFrame: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "frame")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit

        return v
    }()
    
    /// DESCRIPTION
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.font = UIFont(name: Font.regular.name, size: CGFloat(Font.small.size))
        textView.textColor = PSColor.gray.value
        textView.textAlignment = .center
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        installConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        addSubview(imageView)
        addSubview(descriptionTextView)
        addSubview(phoneFrame)
    
        [
            descriptionTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Padding.consecutive.cgFloat()),
            descriptionTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            phoneFrame.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            phoneFrame.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -Padding.consecutive.cgFloat()),
            phoneFrame.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            
            imageView.topAnchor.constraint(equalTo: phoneFrame.topAnchor, constant: 6),
            imageView.trailingAnchor.constraint(equalTo: phoneFrame.trailingAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalTo: phoneFrame.heightAnchor, constant: -Padding.consecutive.cgFloat()),
            imageView.widthAnchor.constraint(equalTo: phoneFrame.widthAnchor, constant: -10),
            
        ].activate()
    }
}

