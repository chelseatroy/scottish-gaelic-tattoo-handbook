//
//  UIColor+Hex.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 11/17/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    struct SGTH {
        static let royalPurple = UIColor(hex: "#4F2A7A")
        static let royalGreen = UIColor(hex: "#238980")
        static let gold = UIColor(hex: "#C39637")
        static let maroon = UIColor(hex: "#8F2A27")
    }
    
    convenience init(hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
