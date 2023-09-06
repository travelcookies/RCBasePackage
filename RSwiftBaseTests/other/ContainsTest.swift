//
//  ContainsTest.swift
//  RSwiftBaseTests
//
//  Created by 林小鹏 on 2023/8/30.
//

import Foundation
import Nimble
import Quick

class SZNormalTest: QuickSpec {
    override func spec() {
        describe("测试 基础函数") {
            beforeEach {
            }
            context("contains 使用") {
                xit("contains") {
//                    let jieguo = ["h", "e", "l", "l", "o"].contains(["h", "o"])
                    let jieguo = ["h", "e", "l", "l", "o"].contains { sn in
                        sn == "z" || sn == "e"
                    }

                    expect(jieguo).to(equal(true))
                }
            }
        }
    }
}
