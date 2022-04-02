//
//  deviceTest.swift
//  
//
//  Created by 林小鹏 on 2022/4/2.
//

import XCTest
@testable import RCBase
class deviceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {


        XCTAssert(rDevice.share.name == "Simulator")

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
