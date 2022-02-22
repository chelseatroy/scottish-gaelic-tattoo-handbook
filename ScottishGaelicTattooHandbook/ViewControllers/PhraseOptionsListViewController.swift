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
    var phrases = [String]()
    var phraseService: PhraseService!
    
    @IBOutlet weak var phraseTableView: UITableView!
    
    override func viewDidLoad() {
        self.phraseTableView.dataSource = self
        self.phraseTableView.delegate = self
        
        self.phraseService = PhraseService()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.phraseService.retrieve(completion: { phrases, error in
             guard let confirmedPhrases = phrases, error == nil else {
                 return
             }
            self.phrases = confirmedPhrases
            self.phraseTableView.reloadData()
        })
    }
}

extension PhraseOptionsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.phrases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.phraseTableView.dequeueReusableCell(withIdentifier: PhraseCell.reuseIdentifier) as? PhraseCell {
            
            cell.phraseLabel.text = self.phrases[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
}

extension PhraseOptionsListViewController: UITableViewDelegate {
    
}
