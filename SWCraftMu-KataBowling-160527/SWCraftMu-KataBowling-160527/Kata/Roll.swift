//
//  Roll.swift
//  SWCraftMu-KataBowling-160527
//
//  Created by Jose on 29/5/16.
//  Copyright © 2016 ByBDesigns. All rights reserved.
//

import Foundation

enum Roll {
	case Roll(Int, Int)
	case Strike(Int, Int)
	
	var score: Int {
		switch self {
		case Roll(let firstFrame, let secondFrame):
			return firstFrame + secondFrame
			
		case Strike(let nextFrame, let afterNextFrame):
			return 10 + nextFrame + afterNextFrame
		}
	}
}

class GameParser {
	let rolls: [Roll]
	
	init(_ game: String) {
		var parsedRolls = 0
		var mutableRolls: [Roll] = []
		
		var index = game.startIndex
		while parsedRolls < 10 {
			switch game.characters[index] {
			case "X":
				mutableRolls.append(.Strike(GameParser.scoreForString(String(game[index.successor()])),
											GameParser.scoreForString(String(game[index.successor().successor()]))))
				index = index.successor()
				
			default:
				mutableRolls.append(.Roll(	GameParser.scoreForString(String(game[index])),
											GameParser.scoreForString(String(game[index.successor()]))))
				index = index.successor().successor()
			}
			
			parsedRolls = parsedRolls + 1
		}
		
		rolls = mutableRolls
	}
}

extension GameParser {
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