//
//  HomeViewController.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 6/27/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit
import WebKit

class HomeViewController: UIViewController, WKNavigationDelegate {
    var blogPostService: BlogPostService!
    
    var slideUpDrawerView: UIView!
    var webView: WKWebView!
    
    @IBOutlet weak var waitSpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var firstPostPreview: UIView!
    @IBOutlet weak var secondPostPreview: UIView!
    @IBOutlet weak var thirdPostPreview: UIView!
    
    @IBOutlet weak var firstBlogPostTitle: UILabel!
    @IBOutlet weak var firstBlogPostImage: UIImageView!
    @IBOutlet weak var secondBlogPostTitle: UILabel!
    @IBOutlet weak var secondBlogPostImage: UIImageView!
    @IBOutlet weak var thirdBlogPostTitle: UILabel!
    @IBOutlet weak var thirdBlogPostImage: UIImageView!
    
    var blogPosts: [BlogPost] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.waitSpinner.startAnimating()
        
        self.slideUpDrawerView = UIView(frame: CGRect(
                x: 0,
                y: self.view.frame.height,
                width: self.view.frame.width,
                height: self.view.frame.height
        ))
        self.slideUpDrawerView.backgroundColor = UIColor.systemGray6
        
        self.webView = WKWebView()
        self.webView.navigationDelegate = self
        self.webView.frame = CGRect(
                x: 0,
                y: 60,
                width: self.view.frame.width,
                height: self.view.frame.height - 40
        )
        self.slideUpDrawerView.addSubview(webView)
        
        let dismissButton = UIButton(frame: CGRect(
            x: 15,
            y: 15,
            width: 50,
            height: 30
        ))
        dismissButton.setTitle("Done", for: .normal)
        dismissButton.setTitleColor(.systemBlue, for: .normal)
        dismissButton.titleLabel?.adjustsFontSizeToFitWidth = true
        dismissButton.addTarget(self, action: #selector(dismissDrawer), for: .touchUpInside)
        self.slideUpDrawerView.addSubview(dismissButton)
        
        self.view.addSubview(self.slideUpDrawerView)
        
        self.blogPostService = BlogPostService()
        
        self.firstBlogPostImage.image = UIImage(named: "knotWithHooks")
        self.secondBlogPostImage.image = UIImage(named: "monkeyFist")
        self.thirdBlogPostImage.image = UIImage(named: "knotWithHooks")
        
        self.firstBlogPostTitle.text = "Coming soon..."
        self.secondBlogPostTitle.text = "Coming soon..."
        self.thirdBlogPostTitle.text = "Coming soon..."
        
        let firstTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToBlogPost(sender:)))
        self.firstPostPreview.addGestureRecognizer(firstTapGesture)
        
        let secondTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToBlogPost(sender:)))
        self.secondPostPreview.addGestureRecognizer(secondTapGesture)
        
        let thirdTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToBlogPost(sender:)))
        self.thirdPostPreview.addGestureRecognizer(thirdTapGesture)
    }
    
    @objc func dismissDrawer() {
        let slideDownDrawerAnimator = UIViewPropertyAnimator(
            duration:0.5,
            curve: .easeIn) {
            self.slideUpDrawerView.frame = CGRect(
                    x: 0,
                    y: self.view.frame.height,
                    width: self.view.frame.width,
                    height: self.view.frame.height
            )
        }
        slideDownDrawerAnimator.startAnimation()
    }
    
    @objc func goToBlogPost(sender: UITapGestureRecognizer) {
        if let blogPostIndex = sender.view?.tag {
            let url = URL(string: self.blogPosts[blogPostIndex].URL)!
            self.webView.load(URLRequest(url: url))
            
            let slideUpDrawerAnimator = UIViewPropertyAnimator(
                duration:0.5,
                curve: .easeIn) {
                self.slideUpDrawerView.frame = CGRect(
                        x: 0,
                        y: 40,
                        width: self.view.frame.width,
                        height: self.view.frame.height
                )
            }
            slideUpDrawerAnimator.startAnimation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.blogPostService.getBlogPosts(completion: { blogPosts, error in
             guard let confirmedBlogPosts = blogPosts, error == nil else {
                 return
             }
            self.blogPosts = confirmedBlogPosts
            
            self.firstBlogPostTitle.text = confirmedBlogPosts[0].title
            self.secondBlogPostTitle.text = confirmedBlogPosts[1].title
            self.thirdBlogPostTitle.text = confirmedBlogPosts[2].title
            
            self.waitSpinner.stopAnimating()
            self.waitSpinner.isHidden = true
            
            self.setImage(for: self.firstBlogPostImage, to: confirmedBlogPosts[0].imageURL)
            self.setImage(for: self.secondBlogPostImage, to: confirmedBlogPosts[1].imageURL)
            self.setImage(for: self.thirdBlogPostImage, to: confirmedBlogPosts[2].imageURL)
        })
    }
    
    private func setImage(for view: UIImageView, to url: String) {
        DispatchQueue.global(qos: .userInitiated).async {
            let blogPostImageData = NSData(contentsOf: URL(string: url)!)
            DispatchQueue.main.async {
                if let convertedData = blogPostImageData as Data?,
                    let hydratedImage = UIImage(data: convertedData)
                    {
                    view.image = hydratedImage
                }
            }
        }
    }


}

