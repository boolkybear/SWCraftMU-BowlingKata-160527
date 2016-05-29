//
//  SWCraftMu-KataBowling-160527-General.swift
//  SWCraftMu-KataBowling-160527
//
//  Created by Jose on 29/5/16.
//  Copyright © 2016 ByBDesigns. All rights reserved.
//

import XCTest
@testable import SWCraftMu_KataBowling_160527

class SWCraftMu_KataBowling_160527_General: XCTestCase {
    
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

	func testRandom1() {
		let counter = BowlingCounter("X123/45X6-718/X34")
		
		XCTAssert(counter.score == 13 + 3 + 14 + 9 + 16 + 6 + 8 + 20 + 17 + 7)
	}
}
