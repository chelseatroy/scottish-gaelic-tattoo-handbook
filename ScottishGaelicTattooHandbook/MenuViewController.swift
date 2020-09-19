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
        SKStoreReviewController.requestReview()
    }
}
