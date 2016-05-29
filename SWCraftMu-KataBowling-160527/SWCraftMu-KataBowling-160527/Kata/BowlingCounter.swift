//
//  BowlingCounter.swift
//  SWCraftMu-KataBowling-160527
//
//  Created by Jose on 28/5/16.
//  Copyright © 2016 ByBDesigns. All rights reserved.
//

import Foundation

class BowlingCounter {
	var score: Int {
		return BowlingCounter.evaluateGame(rolls)
	}
	
	let rolls: [Roll]
	
	init(_ game: String) {
		rolls = GameParser(game).rolls
	}
}

private extension BowlingCounter {
	private static func evaluateGame(rolls: [Roll]) -> Int {
		return rolls.reduce(0) { $0.0 + $0.1.score }
	}
}