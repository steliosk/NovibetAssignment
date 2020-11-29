//
//  BetView.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 29/11/20.
//

import Foundation

struct BetView: Decodable {
    var betViewKey: String?
    var competitionContextCaption: String?
    var marketCaptions: [MarketCaption]?
    var modelType: String?
    var totalCount: Int?
    var competitor1Caption: String?
    var competitor2Caption: String?
    var startTime: String?
    var competitions: [Competition]?
}
