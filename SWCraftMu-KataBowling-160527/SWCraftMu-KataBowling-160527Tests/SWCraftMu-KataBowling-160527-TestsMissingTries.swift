//
//  SWCraftMu-KataBowling-160527-TestsMissingTries.swift
//  SWCraftMu-KataBowling-160527
//
//  Created by Jose on 28/5/16.
//  Copyright © 2016 ByBDesigns. All rights reserved.
//

import XCTest
@testable import SWCraftMu_KataBowling_160527

class SWCraftMu_KataBowling_160527_TestsMissingTries: XCTestCase {

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
	
	// TESTS Tiradas con fallos
	func testOnePinMissSecondTry() {
		let counter = BowlingCounter("1-1-1-1-1-1-1-1-1-1-")
		
		XCTAssert(counter.score == 1*10)
	}
	
	func testOnePinMissFirstTry() {
		let counter = BowlingCounter("-1-1-1-1-1-1-1-1-1-1")
		
		XCTAssert(counter.score == 1*10)
	}

	func testAllFails() {
		let counter = BowlingCounter("--------------------")
		
		XCTAssert(counter.score == 0)
	}
}
