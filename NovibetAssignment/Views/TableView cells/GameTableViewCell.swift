//
//  GameTableViewCell.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    // MARK: - Variables
    
    var elapsedTimer: Timer?
    var elapsedDate: Date?
    
    // MARK: - IBOutles
    
    @IBOutlet weak var firstCompetitorLabel: UILabel!
    @IBOutlet weak var secondCompetitorLabel: UILabel!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    // MARK: - Configure
    
    func confirgure(game: Game?) {
        guard let gameItem = game else {
            return
        }
        firstCompetitorLabel.text = gameItem.competitor1
        secondCompetitorLabel.text = gameItem.competitor2
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss.SSSS"
        if let elapsedTime = gameItem.elapsed {
            elapsedDate = dateFormatter.date(from: elapsedTime)
            startElapsedTimer()
        }
        layoutIfNeeded()
    }
    
    // MARK: - Update
    
    func updateElapsedTime() {
        guard let date = elapsedDate else {
            elapsedTimeLabel.text = "--"
            return
        }
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let dateFormatter = DateFormatter()
        if hour > 0 {
            dateFormatter.dateFormat = "HH:mm:ss"
        } else {
            dateFormatter.dateFormat = "mm:ss"
        }
        let datestring = dateFormatter.string(from: date)
        elapsedTimeLabel.text = datestring
            
    }
    
    func startElapsedTimer() {
        elapsedTimer?.invalidate()
        elapsedTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.elapsedDate?.addTimeInterval(1)
            self.updateElapsedTime()
        })
        elapsedTimer?.fire()
    }
    
    func stopElapsedTimer() {
        elapsedTimer?.invalidate()
    }
    
    // MARK: - Lifecycle
    
    deinit {
        stopElapsedTimer()
    }

}
