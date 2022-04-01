@testable import RCBase
import XCTest

final class RCBaseProjectTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(RCBaseProject().text, "Hello, World!")
        XCTAssert(rTime.returnYear() == "2022", "日期获取失败")
    }
}
