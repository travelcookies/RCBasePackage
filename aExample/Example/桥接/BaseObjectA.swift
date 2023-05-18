//
//  BaseObjectA.swift
//  Example
//
//  Created by 林小鹏 on 2023/5/18.
//

import Foundation
class BaseObjectA {
    var objB: BaseObjectB = BaseObjectB()

    func handle() {
        
        objB.fetchData()
        
    }
}
