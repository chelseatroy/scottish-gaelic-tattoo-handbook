//
//  CategoryCell.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 11/14/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    func setUpView(for category: String, at position: Int) {
        self.categoryLabel.text = category
        
        self.backgroundImage.alpha = 0.1
        switch position {
        case 0:
            self.backgroundColor = UIColor.SGTH.royalPurple
            self.backgroundImage.image = UIImage(named: "monkeyFist")
        case 1, 2:
            self.backgroundColor = UIColor.SGTH.royalGreen
            self.backgroundImage.image = UIImage(named: "knotWithHooks")
        case 3, 4:
            self.backgroundColor = UIColor.SGTH.maroon
            self.backgroundImage.image = UIImage(named: "squareBraids")
        case 5, 6:
            self.backgroundColor = UIColor.SGTH.gold
            self.backgroundImage.image = UIImage(named: "otherSquareBraids")
        case 7, 8:
            self.backgroundColor = UIColor.SGTH.royalPurple
            self.backgroundImage.image = UIImage(named: "monkeyFist")

        default:
            self.backgroundColor = .black
        }
    }
    
}
