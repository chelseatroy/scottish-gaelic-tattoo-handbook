//
//  HomeViewController.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 6/27/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var firstBlogPostTitle: UILabel!
    @IBOutlet weak var firstBlogPostImage: UIImageView!
    @IBOutlet weak var secondBlogPostTitle: UILabel!
    @IBOutlet weak var secondBlogPostImage: UIImageView!
    @IBOutlet weak var thirdBlogPostTitle: UILabel!
    @IBOutlet weak var thirdBlogPostImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstBlogPostImage.image = UIImage(named: "knotWithHooks")
        self.secondBlogPostImage.image = UIImage(named: "monkeyFist")
        self.thirdBlogPostImage.image = UIImage(named: "knotWithHooks")
        
        self.firstBlogPostTitle.text = "Blog Post the First"
        self.secondBlogPostTitle.text = "BlogPost the Second"
        self.thirdBlogPostTitle.text = "Blog Post the Third"
    }


}

