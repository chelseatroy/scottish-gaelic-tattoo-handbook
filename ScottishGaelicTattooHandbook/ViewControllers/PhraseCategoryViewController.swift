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
    
    var categories = [String]()
    var phraseCategoryService: PhraseCategoryService!
    var tappedCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.phraseCategoryService = PhraseCategoryService()
        
        self.categoriesCollectionView.delegate = self
        self.categoriesCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.phraseCategoryService.retrieve(completion: { categories, error in
             guard let confirmedCategories = categories, error == nil else {
                 return
             }
            self.categories = confirmedCategories
            self.categoriesCollectionView.reloadData()
        })
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhraseOptionsListSegue" {
            let destination = segue.destination as! PhraseOptionsListViewController
            destination.category = self.tappedCategory
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        self.tappedCategory = self.categories[indexPath.row]
        performSegue(withIdentifier: "showPhraseOptionsListSegue", sender: self)
    }
}


