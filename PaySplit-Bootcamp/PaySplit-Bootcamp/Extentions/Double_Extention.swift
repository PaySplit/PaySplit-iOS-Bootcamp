//
//  Double_Extention.swift
//  paysplit
//
//  Created by timofey makhlay on 4/10/20.
//  Copyright © 2020 dev. All rights reserved.
//

import UIKit
import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
    
//    /// Remove the decimal if it's a 0. "105.0" becomes "105"
//    var clean: String {
//       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
//    }
    
    /// Remove decimals without rounding
    func truncate(to places: Int) -> Double {
        return Double(Int(pow(10, Double(places)) * self)) / pow(10, Double(places))
    }
//    func truncate(to places: Int) -> Double {
//
//        let newDecimal = pow(10, Double(places)) * self
//        let truncated = Double(Int(newDecimal))
//        let originalDecimal = truncated / pow(10, Double(places))
//        return originalDecimal
//
//    }
//    func truncate(_ places : Int)-> Double
//    {
//        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
//    }
//    func cutOffDecimalsAfter(_ places:Int) -> Double {
//        let divisor = pow(10.0, Double(places))
//        return (self*divisor).rounded(.towardZero) / divisor
//    }
    
    /// Rounds the double to two decimal places
    var roundToTwo: String {
        return String(format:"%.2f", self)
    }
    
}

