//
//  SportsEvent.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 29/11/20.
//

import Foundation

struct SportEvent: Decodable {
    var additionalCaptions: AdditionalCaptions?
    var betContextId: UInt64?
    var hasBetContextInfo: Bool?
    var isHighlighted: Bool?
    var liveData: LiveData?
    var markets: [Market]?
    var path: String?
}
