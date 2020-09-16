//
//  Array_Extention.swift
//  paysplit
//
//  Created by timofey makhlay on 4/10/20.
//  Copyright © 2020 dev. All rights reserved.
//

import UIKit

extension Array where Element == NSLayoutConstraint {
    func activate() {
        for constraint in self {
            constraint.isActive = true
        }
    }
}

extension Array where Element == UIView {
    func disableAutoresizing() {
        for view in self {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

