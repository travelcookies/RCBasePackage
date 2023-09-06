//
//  Foo.swift
//  RSwiftBaseTests
//
//  Created by 林小鹏 on 2023/8/31.
//

import Foundation
import RxCocoa
import RxSwift

class Foo {
    let activityIndicator = ActivityIndicator()

    lazy var activity = activityIndicator.asDriver()

    var disposeBag = DisposeBag()

    func doSomething() {
        // 异步操作
        Observable<Int>.just(1).delay(DispatchTimeInterval.milliseconds(200), scheduler: MainScheduler.instance)
            .trackActivity(activityIndicator).subscribe(onNext: { value in
                print("Received value: \(value)")
            }).disposed(by: disposeBag)

        // 绑定活动指示器
//        activityIndicator.asObservable().bind { _ in
//            UIActivityIndicatorView(style: .gray).startAnimating()
//        }.disposed(by: disposeBag)

        Observable
            .just("this is something")
            .trackActivity(activityIndicator)
            .subscribe({ event in
                print("Activity",event)
            })
            .disposed(by: disposeBag)
    }
}
