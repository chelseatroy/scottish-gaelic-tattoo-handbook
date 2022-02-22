//
//  PhraseCell.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 2/21/22.
//  Copyright © 2022 Chelsea Troy. All rights reserved.
//


import Foundation
import UIKit

class PhraseCell: UITableViewCell {
    static let reuseIdentifier = String(describing: PhraseCell.self)

    @IBOutlet weak var phraseLabel: UILabel!
}
