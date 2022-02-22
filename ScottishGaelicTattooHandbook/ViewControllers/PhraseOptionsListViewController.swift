//
//  PhraseOptionsListViewController.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 2/13/22.
//  Copyright © 2022 Chelsea Troy. All rights reserved.
//

import UIKit

class PhraseOptionsListViewController: UIViewController {
    
    var category: String?
    
    @IBOutlet weak var phraseTitle: UILabel!
    
    override func viewDidLoad() {
        self.phraseTitle.text = category
    }
    
}
