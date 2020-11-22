//
//  SecondViewController.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 6/27/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {

    @IBOutlet weak var clanListViewContainer: UIView!
    @IBOutlet weak var phraseCategoryViewContainer: UIView!
    
    @IBAction func didSwitchViews(_ sender: UISegmentedControl) {
        
        enum PhraseClanSegment: Int {
            case phrases, clans
        }
        
        switch(sender.selectedSegmentIndex) {
        case PhraseClanSegment.phrases.rawValue:
            self.clanListViewContainer.isHidden = true
            self.phraseCategoryViewContainer.isHidden = false
        case PhraseClanSegment.clans.rawValue:
            self.clanListViewContainer.isHidden = false
            self.phraseCategoryViewContainer.isHidden = true
        default:
            let _ = 7
        }
    }
   
}

