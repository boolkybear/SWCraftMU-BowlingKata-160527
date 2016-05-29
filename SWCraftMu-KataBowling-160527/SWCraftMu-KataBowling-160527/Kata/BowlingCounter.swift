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
		var score = 0
		var rolls = 0
		var isFrame = false
		
		var index = game.startIndex
		while rolls < 10 {
			let frameScore: Int
			
			switch game.characters[index] {
			case "X":
				rolls = rolls + 1
				isFrame = false
				
				frameScore = 10	+ scoreForString(String(game.characters[index.successor()]))
								+ scoreForString(String(game.characters[index.successor().successor()]))
			default:
				if isFrame {
					rolls = rolls + 1
					isFrame = false
				} else {
					isFrame = true
				}
				
				frameScore = scoreForString(String(game.characters[index]))
			}
			
			score += frameScore
			index = index.successor()
		}
		
		return score
	}
	
	private static func scoreForString(frame: String) -> Int {
		switch frame {
		case "X":
			return 10
		case "-":
			return 0
		default:
			return Int(frame)!
		}
	}
}