//
//  Command.swift
//  Example
//
//  Created by 林小鹏 on 2023/5/17.
//

import Foundation
typealias CommandCompletionCallBack = (XPCommand) -> Void

class XPCommand {
    let uuid: UInt32 = arc4random()
    /// 命令完成的回调
    var completion: CommandCompletionCallBack?
    /// 执行命令
    func execute() {}
    /// 取消命令
    func cancel() {
        completion = nil
    }

    /// 完成命令
    func done() {
        // 调用 Competion
        if completion != nil {
            completion!(self)
        }
        // 释放
        completion = nil

        CommandManager.share.arrayCommands.removeAll(where: { cmd in
            cmd == self
        })
    }
}

extension XPCommand: Equatable {
}

func == (lhs: XPCommand, rhs: XPCommand) -> Bool {
    return lhs.uuid == rhs.uuid
}
