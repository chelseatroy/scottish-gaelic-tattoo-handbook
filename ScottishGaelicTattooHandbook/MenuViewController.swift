//
//  MenuViewController.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 9/19/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func didTapToRate(_ sender: Any) {
        
        let alert = UIAlertController(
            title: "Rate us!",
            message: "Enjoying the Scottish Gaelic Tattoo Handbook? Please take a moment to rate it in the app store!",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(
            title: "Take me to the app store",
            style: .default) {
                (action: UIAlertAction!) in
                if let url = URL(string: "https://www.apple.com/ios/app-store/") {
                    UIApplication.shared.open(url)
                }
        })
        
        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        ))
        
        self.present(alert, animated: true)
    }
    
}
