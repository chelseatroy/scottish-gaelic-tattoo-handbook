//
//  MenuViewController.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 9/19/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit
import StoreKit

class MenuViewController: UIViewController {

    @IBAction func didTapToRate(_ sender: Any) {
        if let buttonPressed = sender as? UIButton,
            buttonPressed.tag == ButtonTag.rateTheApp.rawValue {
                SKStoreReviewController.requestReview()
        }
    }
    
    enum ButtonTag: Int {
        case aboutTheAuthor, contact, rateTheApp, buyTheBook, copyright
    }
}
