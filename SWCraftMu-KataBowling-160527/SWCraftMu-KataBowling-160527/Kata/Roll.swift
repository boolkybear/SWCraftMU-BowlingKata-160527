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
			let currentFrame = String(game.characters[index])
			let nextFrame = String(game.characters[index.successor()])
			
			switch currentFrame {
			case "X":
				let afterNextFrame = String(game.characters[index.successor().successor()])
				switch afterNextFrame {
				case "/":
					mutableRolls.append(.Strike(GameParser.scoreForString(nextFrame),
												10 - GameParser.scoreForString(nextFrame)))
				default:
					mutableRolls.append(.Strike(GameParser.scoreForString(nextFrame),
												GameParser.scoreForString(afterNextFrame)))
				}
				
				index = index.successor()
				
			default:
				switch nextFrame {
				case "/":
					let afterNextFrame = String(game.characters[index.successor().successor()])
					mutableRolls.append(.Spare(GameParser.scoreForString(afterNextFrame)))
				
				default:
					mutableRolls.append(.Roll(	GameParser.scoreForString(currentFrame),
												GameParser.scoreForString(nextFrame)))
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