//
//  AdditionalCaptions.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 29/11/20.
//

import Foundation

struct AdditionalCaptions: Decodable {
    var type: Int?
    var competitor1: String?
    var competitor1ImageId: UInt64?
    var competitor2: String?
    var competitor2ImageId: UInt64?
}
