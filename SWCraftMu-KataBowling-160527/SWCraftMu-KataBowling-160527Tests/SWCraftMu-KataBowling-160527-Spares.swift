//
//  SWCraftMu-KataBowling-160527-Spares.swift
//  SWCraftMu-KataBowling-160527
//
//  Created by Jose on 29/5/16.
//  Copyright © 2016 ByBDesigns. All rights reserved.
//

import XCTest
@testable import SWCraftMu_KataBowling_160527

class SWCraftMu_KataBowling_160527_Spares: XCTestCase {
    
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
	
	func testSparesOne() {
		let counter = BowlingCounter("1/1/1/1/1/1/1/1/1/1/1")
		
		XCTAssert(counter.score == (10 + 1)*10)
	}
	
	func testSparesAndMiss() {
		let counter = BowlingCounter("-/-/-/-/-/-/-/-/-/-/-")
		
		XCTAssert(counter.score == 10 * 10)
	}
	
	func testSparesEndWithStrike() {
		let counter = BowlingCounter("-/-/-/-/-/-/-/-/-/-/X")
		
		XCTAssert(counter.score ==	10 * 9 +
									10 + 10)
	}
}
