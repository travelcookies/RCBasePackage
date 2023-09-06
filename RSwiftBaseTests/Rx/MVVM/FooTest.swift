//
//  FooTest.swift
//  RSwiftBaseTests
//
//  Created by 林小鹏 on 2023/8/31.
//

import Foundation
import Nimble
import Quick
import RxCocoa
import RxSwift

class FooTest: QuickSpec {
    override func spec() {
        describe("Foo Tests") {
            context("activityIndicator 使用") {
                it("activityIndicator") {
                    let foo = Foo()
                    foo.doSomething()

                }
            }
        }
    }
}
