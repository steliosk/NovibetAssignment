//
//  BetItem.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 29/11/20.
//

import Foundation

struct BetItem: Decodable {
    var id: UInt64?
    var code: String?
    var caption: String?
    var instanceCaption: String?
    var isAvailable: Bool?
    var oddsText: String?
    var price: Double?
}
