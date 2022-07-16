//
//  RSwiftBaseTests.swift
//  RSwiftBaseTests
//
//  Created by 林小鹏 on 2022/4/7.
//

import XCTest
@testable import RSwiftBase

class RSwiftBaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let view = UIView()
        view.frame = CGRect(x: 10, y: 20, width: 100, height: 200)

        XCTAssert(view.centerY == 120)
        
        
        let sss = Async()
        sss.test()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
