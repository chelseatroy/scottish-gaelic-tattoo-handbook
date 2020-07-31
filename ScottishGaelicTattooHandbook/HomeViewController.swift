//
//  HomeViewController.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 6/27/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var blogPostService: BlogPostService!
    
    @IBOutlet weak var waitSpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var firstBlogPostTitle: UILabel!
    @IBOutlet weak var firstBlogPostImage: UIImageView!
    @IBOutlet weak var secondBlogPostTitle: UILabel!
    @IBOutlet weak var secondBlogPostImage: UIImageView!
    @IBOutlet weak var thirdBlogPostTitle: UILabel!
    @IBOutlet weak var thirdBlogPostImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.waitSpinner.startAnimating()
        
        self.blogPostService = BlogPostService()
        
        self.firstBlogPostImage.image = UIImage(named: "knotWithHooks")
        self.secondBlogPostImage.image = UIImage(named: "monkeyFist")
        self.thirdBlogPostImage.image = UIImage(named: "knotWithHooks")
        
        self.firstBlogPostTitle.text = "Coming soon..."
        self.secondBlogPostTitle.text = "Coming soon..."
        self.thirdBlogPostTitle.text = "Coming soon..."
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.blogPostService.getBlogPosts(completion: { blogPosts, error in
             guard let confirmedBlogPosts = blogPosts, error == nil else {
                 return
             }
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

