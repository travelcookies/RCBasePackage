//
//  RSwiftBaseTests.swift
//  RSwiftBaseTests
//
//  Created by 林小鹏 on 2022/4/7.
//

import RSwiftBase
import XCTest

import Nimble
import Quick

class RSwiftBaseTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        print(rTime.returnFutureByMonthWeekday(count: 5))

        let color = UIColor.xp.hexa(hexString: "#213321", a: 1.0)

        XCTAssert(color.xp.toHexString() == "#213321", "当月第一天是星期几")
    }

    func testSExample() throws {
        let mmm = timestampGet()

//        var numb = "1221312 12312321"
//        var newTime = ""
//        numb.replacingOccurrences(of: " ", with: "+")
        print(mmm)

//        XCTAssert(color.xp.toHexString() == "#213321", "当月第一天是星期几")
    }

    /// 获取当前格式化时间
    fileprivate func timestampGet() -> String {
        let date = Date()
        let timeFormatter = DateFormatter()
        // 日期显示格式，可按自己需求显示
        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let strNowTime = timeFormatter.string(from: date) as String
        return strNowTime
    }

//
//    func getClass<T>(_ childVCName: String, _ type: T.Type) -> T? {
//        // 1. 获取命名空间
//        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
//            return nil
//        }
//        // 2. 根据字符串获取对应的Class
//        guard let childVCClass = NSClassFromString(nameSpace + "." + childVCName) else {
//            return nil
//        }
//
//        // 3. 将对应的anyobject 转换成控制器类型
//        guard let childVCType = childVCClass as? type else {
//            return nil
//        }
//        // 4.创建对应的控制器对象
//        let childVC = childVCType.init()
//
//        return childVC
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
