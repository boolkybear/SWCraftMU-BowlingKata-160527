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
	case Spare(Int)
	
	var score: Int {
		switch self {
		case Roll(let firstFrame, let secondFrame):
			return firstFrame + secondFrame
			
		case Strike(let nextFrame, let afterNextFrame):
			return 10 + nextFrame + afterNextFrame
			
		case Spare(let nextFrame):
			return 10 + nextFrame
		}
	}
}

class GameParser {
	let rolls: [Roll]
	
	init(_ game: String) {
		var mutableRolls: [Roll] = []
		
		var index = game.startIndex
		for _ in 0..<10 {
			switch game.characters[index] {
			case "X":
				mutableRolls.append(.Strike(GameParser.scoreForString(String(game[index.successor()])),
											GameParser.scoreForString(String(game[index.successor().successor()]))))
				index = index.successor()
				
			default:
				let nextFrame = game.characters[index.successor()]
				switch nextFrame {
				case "/":
					mutableRolls.append(.Spare(GameParser.scoreForString(String(game[index.successor().successor()]))))
				
				default:
					mutableRolls.append(.Roll(	GameParser.scoreForString(String(game[index])),
												GameParser.scoreForString(String(game[index.successor()]))))
				}
				index = index.successor().successor()
			}
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