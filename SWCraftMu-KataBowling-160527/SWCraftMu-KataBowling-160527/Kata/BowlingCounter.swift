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
		return game.characters.reduce(0) {
			let tryScore: Int
			switch $0.1 {
			case "X":
				tryScore = 300/12
			case "-":
				tryScore = 0
			default:
				tryScore = Int(String($0.1))!
			}
			
			return $0.0 + tryScore
		}
	}
}