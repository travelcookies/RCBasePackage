//
//  Extension.swift
//  RSwiftBaseTests
//
//  Created by 林小鹏 on 2022/8/2.
//

import RSwiftBase
import UIKit
import XCTest

class ExtensionDate: XCTestCase {
    func testDate() {
        let date = Date(timeIntervalSinceReferenceDate: 2)
        XCTAssert(date.xp.year == 2001, "获取年份")
        XCTAssert(date.xp.month == 1, "获取月份")
        XCTAssert(date.xp.day == 1, "获取天数")
        XCTAssert(date.xp.weakDay == 1, "星期几")
        XCTAssert(date.xp.currentMonthNumber == 31, "获取当月天数")
        XCTAssert(date.xp.firstWeekDay == 1, "当月第一天是星期几")
    }

    func testDateCompare() {
        let date = Date()

        XCTAssert(date.xp.isToday, "是否是今天")
        XCTAssert(date.xp.isCurrentMonth, "是否是这个月")

        print(date.xp.timeStamp)
        print(date.xp.milliStamp)
    }
}
