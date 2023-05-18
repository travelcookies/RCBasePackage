//
//  AdapterTarget.swift
//  Example
//
//  Created by 林小鹏 on 2023/5/17.
//

import Foundation
class AdapterTarget {
    lazy var oldTarger = OldTarget()

    func adapertRequest() {
        print("新增额外处理A")
        oldTarger.oldOperation()
        print("新增额外处理B")
    }
}
