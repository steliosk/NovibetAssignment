//
//  BetItemsResponse.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//

import Foundation

protocol BetViewsResponse: Decodable {
    var betViews: [BetView]? { get set}
    var caption: String? { get set}
    var hasHighlights: Bool? { get set}
    var marketViewKey: String { get set}
    var marketViewType: String? { get set}
    var modelType: String? { get set}
    var totalCount: Int? { get set}
}
