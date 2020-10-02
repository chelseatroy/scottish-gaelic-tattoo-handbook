//
//  BottomDrawerView.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 10/2/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewDrawer: UIView {
    var webView: WKWebView!
    let controller: UIViewController!
    
    init(for controller: UIViewController) {
        self.controller = controller
        super.init(frame: CGRect(
                x: 0,
                y: controller.view.frame.height,
                width: controller.view.frame.width,
                height: controller.view.frame.height
        ))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareToInstall(adjustForNavigation: Bool = false) {
         self.backgroundColor = UIColor.systemGray6
         
         self.webView = WKWebView()
        self.webView.navigationDelegate = controller as? WKNavigationDelegate
        
        var navigationHeight: Int = 0
        if adjustForNavigation {
            navigationHeight = 42
        }
        let initialHeight = CGFloat(navigationHeight + 60)
        
         self.webView.frame = CGRect(
                 x: 0,
                 y: initialHeight,
                 width: self.controller.view.frame.width,
                 height: self.controller.view.frame.height - 40
         )
         self.addSubview(webView)
         
         let dismissButton = UIButton(frame: CGRect(
             x: 15,
             y: 15 + navigationHeight,
             width: 50,
             height: 30
         ))
         dismissButton.setTitle("Done", for: .normal)
         dismissButton.setTitleColor(.systemBlue, for: .normal)
         dismissButton.titleLabel?.adjustsFontSizeToFitWidth = true
        dismissButton.addTarget(self, action: #selector(dismissDrawer), for: .touchUpInside)
         self.addSubview(dismissButton)
    }
    
    @objc func dismissDrawer() {
        let slideDownDrawerAnimator = UIViewPropertyAnimator(
            duration:0.5,
            curve: .easeIn) {
            self.frame = CGRect(
                    x: 0,
                    y: self.controller.view.frame.height,
                    width: self.controller.view.frame.width,
                    height: self.controller.view.frame.height
            )
        }
        slideDownDrawerAnimator.startAnimation()
    }
    
    func animateWebViewToURL(urlString: String) {
        let url = URL(string: urlString)!

        self.webView.load(URLRequest(url: url))
        
        let slideUpDrawerAnimator = UIViewPropertyAnimator(
            duration:0.5,
            curve: .easeIn) {
            self.frame = CGRect(
                    x: 0,
                    y: 40,
                    width: self.controller.view.frame.width,
                    height: self.controller.view.frame.height
            )
        }
        slideUpDrawerAnimator.startAnimation()
    }
    
}
