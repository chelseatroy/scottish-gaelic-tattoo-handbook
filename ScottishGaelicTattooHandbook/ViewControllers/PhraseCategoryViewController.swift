//
//  PhraseCategoryViewController.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 11/21/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class PhraseCategoryViewController: UIViewController {

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

}

extension PhraseCategoryViewController: UICollectionViewDataSource {
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

extension PhraseCategoryViewController: UICollectionViewDelegate {
    
}


