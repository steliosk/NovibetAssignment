//
//  Competition.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 29/11/20.
//

import Foundation

struct Competition: Decodable {
    var betContextId: UInt64?
    var caption: String?
    var regionCaption: String?
    var events: [SportEvent]?
}
