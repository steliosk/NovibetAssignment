//
//  GamesResponse.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//

import Foundation

struct GamesResponse: BetItemsResponse {
    var betViews: [BetView]?
    var caption: String?
    var hasHighlights: Bool?
    var marketViewKey: String
    var marketViewType: String?
    var modelType: String?
    var totalCount: Int?
}
