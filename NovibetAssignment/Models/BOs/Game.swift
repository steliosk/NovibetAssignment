//
//  Games.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//

import Foundation

struct Game: Decodable {
    var competitor1: String?
    var competitor2: String?
    var elapsed: String?
    
    init(event: Event?) {
        competitor1 = event?.additionalCaptions?.competitor1
        competitor2 = event?.additionalCaptions?.competitor2
        elapsed = event?.liveData?.elapsed
    }
}
