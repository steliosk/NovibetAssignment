//
//  HeadlinesResponse.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

struct HeadlinesResponse: BetViewsResponse {
    var betViews: [BetView]?
    var caption: String?
    var hasHighlights: Bool?
    var marketViewKey: String
    var marketViewType: String?
    var modelType: String?
    var totalCount: Int?
}
