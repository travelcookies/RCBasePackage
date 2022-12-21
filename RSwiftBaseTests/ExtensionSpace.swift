//
//  ExtensionSpace.swift
//  RSwiftBaseTests
//
//  Created by 林小鹏 on 2022/12/1.
//

import RSwiftBase
import XCTest

import Nimble
import Quick

/// it， describe 和 context 来编写我们的测试。
// describe 和 context 只是 it 示例的逻辑分组。
class ExtensionUIColorSpaceTests: QuickSpec {
    override func spec() {
        var subjectColor = UIColor()
        describe("测试#22222字符段设置颜色") {
            beforeEach {
                subjectColor = UIColor.xp.hexa(hexString: "#213321", a: 1.0)

//                XCTAssert(color.xp.toHexString() == "#213321", "当月第一天是星期几")
            }

            context("判断和toHexString() 生成的字符") {
                it("应该是相等的") {
                    expect(subjectColor.xp.toHexString()).to(equal("#213321"))
                }
            }
        }
    }
}


class ExtensionIntSpaceTests: QuickSpec {
    override func spec() {
        describe("Int 扩展方法测试") {
            let money:Int = 12322
            var changeMoneyString = ""
            beforeEach {
                changeMoneyString = money.xp.fen2YuanDecimalFormatterValue() ?? ""
            }

            context("判断和changeMoneyString") {
                it("应该是相等的") {
                    expect(changeMoneyString).to(equal("123.22"))
                }
            }
        }
        
        describe("Int 时间转换") {
            let time1 = 10
            let time2 = 70
            let time3 = 3620
            
            var times1 = ""
            var times2 = ""
            var times3 = ""

            beforeEach {
                times1 = time1.xp.timeToStringFormatterValue()
                times2 = time2.xp.timeToStringFormatterValue()
                times3 = time3.xp.timeToStringFormatterValue()
            }

            context("判断时间转换") {
                it("应该是相等的") {
                    expect(times1).to(equal("10秒"))
                    expect(times2).to(equal("1分钟10秒"))
                    expect(times3).to(equal("1小时0分钟20秒"))
                }
            }
        }
    }
}
