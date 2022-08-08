//
//  ExtensionString.swift
//  RSwiftBaseTests
//
//  Created by 林小鹏 on 2022/8/2.
//

import RSwiftBase
import UIKit
import XCTest

class ExtensionString: XCTestCase {

    func test() {
        
//        let test1 = "123456789"
//        print(test1.xp[NSRange(location: 0, length: 10)])
    }
    
    
    func testLabelHeight() {
        /// 计算宽度
        let testString = "测试测试测试123123"
        print(testString.xp.widthForComment(fontSize: 15))
        XCTAssert(testString.xp.widthForComment(fontSize: 15) == 142.0, "计算宽度")
    }
}
