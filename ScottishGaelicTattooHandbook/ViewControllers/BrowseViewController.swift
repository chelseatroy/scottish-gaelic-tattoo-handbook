//
//  SecondViewController.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 6/27/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    let categories = [
        "Place & Identity",
        "Family",
        "Love & Friendship",
        "In Memoriam",
        "Religious & Spiritual",
        "Courage, Honor & Military",
        "Work, Activity & Identity",
        "Emotion, Quality & Concepts",
        "Gaelic Proverbs & Expressions"
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categoriesCollectionView.delegate = self
        self.categoriesCollectionView.dataSource = self
    }

    
    @IBAction func didSwitchViews(_ sender: Any) {
        let segments = sender as! UISegmentedControl
        
        enum PhraseClanSegment: Int {
            case phrases, clans
        }
        
        switch(segments.selectedSegmentIndex) {
        case PhraseClanSegment.phrases.rawValue:
            self.categoriesCollectionView.isHidden = false
            self.clansTableView.isHidden = true
        case PhraseClanSegment.clans.rawValue:
            self.categoriesCollectionView.isHidden = true
            self.clansTableView.isHidden = false
        default:
            let _ = 7
        }
    }
    
   
}

extension BrowseViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.categoriesCollectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCell.reuseIdentifier,
            for: indexPath
        ) as? CategoryCell {
            cell.setUpView(
                for: self.categories[indexPath.row],
                at: indexPath.row
            )
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
}

extension BrowseViewController: UICollectionViewDelegate {
    
}


