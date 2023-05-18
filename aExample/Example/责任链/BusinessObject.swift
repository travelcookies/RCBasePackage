//
//  BusinessObject.swift
//  Example
//
//  Created by 林小鹏 on 2023/5/18.
//

import Cocoa

class BusinessObject: NSObject {
    /// 某一业务完成之后, 返回的结果是否有处理掉这个业务
    typealias CompletionBlock = (Bool) -> Void
    /// 这个业务对应的处理者, 有没有处理好这个业务
    typealias ResultBlock = (BusinessObject?, Bool) -> Void

    /// 下一个响应者（响应链构成的关键）
    var nextBusiness: BusinessObject?

    func handle(result: ResultBlock?) {
        var completion: CompletionBlock = { handled in

            if handled {
                result?(self, handled)
            } else {
                if self.nextBusiness != nil {
                    self.nextBusiness?.handle(result: result)
                } else {
                    result?(nil, false)
                }
            }
        }
        
        self.handleBusiness(completion: completion)
    }

    func handleBusiness(completion: CompletionBlock?) {
        /**
         业务逻辑处理
         例如异步网络请求、异步本地照片查询等
         交给子类复写
         */

    }
}
