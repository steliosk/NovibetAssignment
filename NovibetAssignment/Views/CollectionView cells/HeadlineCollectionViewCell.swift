//
//  HeadlineCollectionViewCell.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//

import UIKit

class HeadlineCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var firstCompetitorLabel: UILabel!
    @IBOutlet weak var secondCompetitorLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    
    // MARK: - Configure
    
    func configure(headline: Headline?) {
        firstCompetitorLabel.text = headline?.competitor1Caption
        secondCompetitorLabel.text = headline?.competitor2Caption
        startTimeLabel.text = headline?.startTime
    }
}
