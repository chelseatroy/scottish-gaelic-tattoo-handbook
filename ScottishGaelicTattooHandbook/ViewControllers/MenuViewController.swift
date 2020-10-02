//
//  MenuViewController.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 9/19/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit
import StoreKit
import WebKit

class MenuViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var buyTheBookView: UIView!
    
    var webViewDrawer: WebViewDrawer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webViewDrawer = WebViewDrawer(for: self)
        self.webViewDrawer.prepareToInstall(adjustForNavigation: true)
        self.view.addSubview(self.webViewDrawer)

        
        let tapToBuy = UITapGestureRecognizer(target: self, action: #selector(goToBookSale(sender:)))
        self.buyTheBookView.addGestureRecognizer(tapToBuy)
    }
    
    @IBAction func didTapToRate(_ sender: Any) {
        if let buttonPressed = sender as? UIButton,
            buttonPressed.tag == ButtonTag.rateTheApp.rawValue {
                SKStoreReviewController.requestReview()
        }
    }
    
    @objc func goToBookSale(sender: UITapGestureRecognizer) {
        self.webViewDrawer.animateWebViewToURL(urlString: WebDestination.bookPurchasePage.rawValue)
    }
    
    enum ButtonTag: Int {
        case aboutTheAuthor, contact, rateTheApp, buyTheBook, copyright
    }
}
