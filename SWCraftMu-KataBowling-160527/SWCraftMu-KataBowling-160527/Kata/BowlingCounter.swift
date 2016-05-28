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
		return BowlingCounter.evaluateGame(game)
	}
	
	let game: String
	
	init(_ game: String) {
		self.game = game
	}
}

private extension BowlingCounter {
	private static func evaluateGame(game: String) -> Int {
		return game.characters.reduce(0) { $0.0 + (Int(String($0.1)) ?? 0) }
	}
}