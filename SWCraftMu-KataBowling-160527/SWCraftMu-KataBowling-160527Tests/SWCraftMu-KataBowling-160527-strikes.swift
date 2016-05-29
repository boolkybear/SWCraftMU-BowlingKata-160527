//
//  SWCraftMu-KataBowling-160527-strikes.swift
//  SWCraftMu-KataBowling-160527
//
//  Created by Jose on 29/5/16.
//  Copyright © 2016 ByBDesigns. All rights reserved.
//

import XCTest
@testable import SWCraftMu_KataBowling_160527

class SWCraftMu_KataBowling_160527_strikes: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }

	func testAllStrikes() {
		let counter = BowlingCounter("XXXXXXXXXXXX")
		
		XCTAssert(counter.score == 30*10)
	}
	
	func testOnlyFirstStrike() {
		let counter = BowlingCounter("X------------------")
		
		XCTAssert(counter.score == 10)
	}
	
	func testRandomStrikesAndRolls() {
		let counter = BowlingCounter("X12X34X54X32X1-")
		
		XCTAssert(counter.score ==	10 + 1 + 2 +
									1 + 2 +
									10 + 3 + 4 +
									3 + 4 +
									10 + 5 + 4 +
									5 + 4 +
									10 + 3 + 2 +
									3 + 2 +
									10 + 1 +
									1)
	}
	
	func testEndsWithStrikeAndRoll() {
		let counter = BowlingCounter("XXXXXXXXXX12")
		
		XCTAssert(counter.score == (10 + 10 + 10) * 8 +
								   (10 + 10 + 1) +
								   (10 + 1 + 2))
	}
	
	func testEndsWithStrikes() {
		let counter = BowlingCounter("------------------XXX")
		
		XCTAssert(counter.score == 30)
	}
	
	func testEndsWithStrikeAndSpare() {
		let counter = BowlingCounter("------------------X-/")
		
		XCTAssert(counter.score == 20)
	}
}
