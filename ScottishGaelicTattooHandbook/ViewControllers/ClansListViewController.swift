//
//  ClansListViewController.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 11/21/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class ClansListViewController: UIViewController {
    @IBOutlet weak var clanTableView: UITableView!
    
    var clans = [String]()
    var clanService: ClanService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clanTableView.dataSource = self
        self.clanTableView.delegate = self
        
        self.clanService = ClanService()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.clanService.retrieve(completion: { clans, error in
             guard let confirmedClans = clans, error == nil else {
                 return
             }
            self.clans = confirmedClans
            self.clanTableView.reloadData()
        })
    }
}

extension ClansListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.clans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.clanTableView.dequeueReusableCell(withIdentifier: ClanCell.reuseIdentifier) as? ClanCell {
            
            cell.clanLabel.text = self.clans[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}

extension ClansListViewController: UITableViewDelegate {
    
}
