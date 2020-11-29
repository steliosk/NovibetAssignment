//
//  LiveData.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 29/11/20.
//

import Foundation

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
