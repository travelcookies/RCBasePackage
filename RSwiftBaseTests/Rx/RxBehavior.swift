//
//  RxBehavior.swift
//  RSwiftBaseTests
//
//  Created by 林小鹏 on 2023/8/31.
//  BehaviorRelay 或者 BehaviorSubject

import Foundation
import Nimble
import Quick
import RxCocoa
import RxSwift

class RxBehavior: QuickSpec {
    override func spec() {
        describe("BehaviorRelay 和 BehaviorSubject") {
            /// “它会将源 Observable 中最新的元素发送出来（如果不存在最新的元素，就发出默认元素）。然后将随后产生的元素发送出来。”
            /// “如果源 Observable 因为产生了一个 error 事件而中止， BehaviorSubject 就不会发出任何元素，而是将这个 error 事件发送出来。”
            context("BehaviorSubject 使用") {
                it("contains") {
                    let disposeBag = DisposeBag()
                    let subjcct = BehaviorSubject(value: "n1")

                    subjcct.subscribe {
                        print("Event1:", $0)
                    }.disposed(by: disposeBag)
                    subjcct.onNext("n2")
                    subjcct.onNext("n3")
                    subjcct.subscribe {
                        print("Event2:", $0)
                    }.disposed(by: disposeBag)

                    subjcct.onNext("b1")
                    subjcct.onNext("b2")
                    subjcct.subscribe {
                        print("Event3:", $0)
                        print("Event3:", $0.element ?? "")
                    }.disposed(by: disposeBag)
                    subjcct.onNext("c1")
                    subjcct.onNext("c2")
                    subjcct.onCompleted()
                    subjcct.onNext("d1")
                }
            }

            /// BehaviorRelay 就是 BehaviorSubject 去掉终止事件 onError 或 onCompleted
            xcontext("BehaviorRelay 使用") {
                xit("contains") {
                    let disposeBag = DisposeBag()
                    let relay = BehaviorRelay(value: "n1")

                    relay.subscribe {
                        print("EventType1:", $0.element ?? "")
                    }.disposed(by: disposeBag)

                    relay.accept("n2")
                    relay.accept("n3")

                    relay.subscribe {
                        print("EventType2:", $0.element ?? "")
                        expect($0.element ?? "").to(equal("n3"))
                    }.disposed(by: disposeBag)
                }
            }
        }
    }
}

//                    waitUntil { done in
//
//                        relay.subscribe {
//                            print("Event:", $0)
//                            expect($0).toNot(equal(nil))
//                            done()
//                        }.disposed(by: disposeBag)
//                    }
