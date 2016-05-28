//
//  SWCraftMu_KataBowling_160527Tests.swift
//  SWCraftMu-KataBowling-160527Tests
//
//  Created by Jose on 28/5/16.
//  Copyright © 2016 ByBDesigns. All rights reserved.
//

import XCTest
@testable import SWCraftMu_KataBowling_160527

class SWCraftMu_KataBowling_160527Tests: XCTestCase {
    
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
	
	func testOnePinEachTry() {
		let counter = BowlingCounter("11111111111111111111")
		
		XCTAssert(counter.score == 1*20)
	}
	
	func testTwoPinsEachTry() {
		let counter = BowlingCounter("22222222222222222222")
		
		XCTAssert(counter.score == 2*20)
	}
	
	func testNinePinsEachTurn() {
		let counter = BowlingCounter("45454545454545454545")
		
		XCTAssert(counter.score == (4+5)*10)
	}
	
	func testRandomPins() {
		let counter = BowlingCounter("12345432123454321234")
		
		XCTAssert(counter.score == 1+2+3+4+5+4+3+2+1+2+3+4+5+4+3+2+1+2+3+4)
	}
}
