//
//  CommandManager.swift
//  Example
//
//  Created by 林小鹏 on 2023/5/17.
//

import Foundation

class CommandManager {
    var arrayCommands: [XPCommand] = []
    static let share = CommandManager()

    func executeCommand(cmd: XPCommand?, completion: CommandCompletionCallBack?) {
        guard let cmd = cmd else {
            return
        }
        // 如果命令正在执行不做处理, 否则添加并执行命令
        if !_isExecutingCommand(cmd: cmd) {
            // 添加到命令容器当中
            arrayCommands.append(cmd)
            // 设置具体命令执行完成后的回调
            cmd.completion = completion
            // 调用具体命令执行方法
            cmd.execute()
        }
    }

    func cancelCommand(cmd: XPCommand?) {
        guard let cmd = cmd else {
            return
        }
        // 从命令容器当中移除
        arrayCommands.removeAll(where: { cmd in
            cmd as? AnyHashable == (self as? AnyHashable ?? nil)
        })

        // 取消命令执行
        cmd.cancel()
    }

    func _isExecutingCommand(cmd: XPCommand?) -> Bool {
        guard let cmd = cmd else {
            return false
        }

        for model in arrayCommands {
            if cmd == model {
                return true
            }
        }

        return false
    }
}
