//
//  LikedCommand.swift
//  Example
//
//  Created by 林小鹏 on 2023/5/17.
//

import Foundation
class LikedCommand: XPCommand {
    override func execute() {
        super.execute()
        /// 执行点赞操作
        print("点赞")
        done()
    }
}
