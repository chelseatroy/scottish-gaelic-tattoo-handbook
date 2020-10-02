//
//  BuyTheBookViewController.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 10/2/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class BuyTheBookViewController: UIViewController {

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
    
    @objc func goToBookSale(sender: UITapGestureRecognizer) {
        self.webViewDrawer.animateWebViewToURL(urlString: "https://www.amazon.com/Scottish-Gaelic-Tattoo-Handbook-Authentic/dp/0995099804")
    }

    

}
