//
//  BetItemsResponse.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//

import Foundation

protocol BetItemsResponse: Decodable {
    var betViews: [BetView]? { get set}
    var caption: String? { get set}
    var hasHighlights: Bool? { get set}
    var marketViewKey: String { get set}
    var marketViewType: String? { get set}
    var modelType: String? { get set}
    var totalCount: Int? { get set}
}

struct BetView: Decodable {
    var betViewKey: String?
    var competitionContextCaption: String?
    var marketCaptions: [MarketCaptions]?
    var modelType: String?
    var totalCount: Int?
    var competitor1Caption: String?
    var competitor2Caption: String?
    var startTime: String?
    var competitions: [Competition]?
}

struct MarketCaptions: Decodable {
    var betCaptions: [String]?
    var betTypeSysname: String?
    var marketCaption: String?
}

struct Competition: Decodable {
    var betContextId: UInt64?
    var caption: String?
    var events: [Event]?
    var regionCaption: String?
}

struct Event: Decodable {
    var additionalCaptions: AdditionalCaptions?
    var betContextId: UInt64?
    var hasBetContextInfo: Bool?
    var isHighlighted: Bool?
    var liveData: LiveData?
    var markets: [Market]?
    var path: String?
}

struct Market: Decodable {
    var betItems: [BetItem]?
    var betTypeSysname: String
    var marketId: UInt64?
}

struct BetItem: Decodable {
    var caption: String?
    var code: String?
    var id: UInt64?
    var instanceCaption: String?
    var isAvailable: Bool?
    var oddsText: String?
    var price: Double?
}

struct AdditionalCaptions: Decodable {
    var competitor1: String?
    var competitor1ImageId: UInt64?
    var competitor2: String?
    var competitor2ImageId: UInt64?
    var type: Int?
}

struct LiveData: Decodable {
    var adjustTimeMillis: Int?
    var awayPoints: Int?
    var duration: String?
    var durationSeconds: Double?
    var elapsed: String?
    var elapsedSeconds: Double?
    var homePoints: Int?
    var homePossession: Bool?
    var isInPlay: Bool?
    var isInPlayPaused:Bool?
    var isInterrupted: Bool?
    var isLive: Bool?
    var liveStreamingCountries: String?
    var phaseCaption: String?
    var phaseCaptionLong: String?
    var phaseSysname:String?
    var quarterScores: [QuarterScore]?
    var referenceTime: String?
    var referenceTimeUnix: UInt64?
    var remaining: String?
    var remainingSeconds: Double?
    var sportradarMatchId: UInt64?
    var supportsAchievements: Bool?
    var supportsActions: Bool?
    var timeToNextPhase: String?
    var timeToNextPhaseSeconds: Double??
    var timeline: String?
}

struct QuarterScore: Decodable {
    var awayScore: Int?
    var caption: String?
    var homeScore: Int?
}
