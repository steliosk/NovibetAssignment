//
//  Headlines.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//

import Foundation

struct Headline: Decodable {
    var competitor1Caption: String?
    var competitor2Caption: String?
    var startTime: String?
    
    init(betView: BetView?) {
        competitor1Caption = betView?.competitor1Caption
        competitor2Caption = betView?.competitor2Caption
        startTime = betView?.startTime
    }
}
