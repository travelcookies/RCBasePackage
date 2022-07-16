//
//  RSwiftBaseTests.swift
//  RSwiftBaseTests
//
//  Created by 林小鹏 on 2022/4/7.
//

@testable import RSwiftBase
import XCTest

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

        let button = UIButton()

//        button.xp.sjsiji()

//        XCTAssert(view.centerY == 120)

//        let sss = Async()
//        sss.test()

//        let nunb = 22123
//        nunb.xp.fen2YuanDecimalFormatterValue()
//        nunb.fen2YuanDecimalFormatterValue()
//
//        UIView.xp.loadFromNib()

        let mnn = Date()
        mnn.xp.year

        let c = 0x1231232.xp.hexa(0.5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
