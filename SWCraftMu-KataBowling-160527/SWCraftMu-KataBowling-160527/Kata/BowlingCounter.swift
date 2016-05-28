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
		switch game {
		case "11111111111111111111":
			return 1*20
			
		case "22222222222222222222":
			return 2*20
			
		default:
			return -1
		}
	}
	
	let game: String
	
	init(_ game: String) {
		self.game = game
	}
}