//
//  Market.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 29/11/20.
//

import Foundation

struct Market: Decodable {
    var marketId: UInt64?
    var betTypeSysname: String?
    var betItems: [BetItem]?
}
