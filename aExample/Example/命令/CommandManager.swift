//
//  CommandManager.swift
//  Example
//
//  Created by 林小鹏 on 2023/5/17.
//

import Foundation

class CommandManager {
    var arrayCommands: [Command] = []
    static let share = CommandManager()

    func executeCommand(cmd: Command?, completion: CommandCompletionCallBack?) {
        guard let cmd = cmd else {
            return
        }
        // 如果命令正在执行不做处理, 否则添加并执行命令
        if _isExecutingCommand(cmd: cmd) {
            // 添加到命令容器当中
            arrayCommands.append(cmd)
            // 设置具体命令执行完成后的回调
            cmd.completion = completion
            // 调用具体命令执行方法
            cmd.execute()
        }
    }

    func cancelCommand(cmd: Command?) {
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

    fileprivate func _isExecutingCommand(cmd: Command?) -> Bool {
        guard let cmd = cmd else {
            return false
        }
        arrayCommands.forEach { cmd1 in
            // 当前命令正在执行
            if (cmd as! AnyHashable) == (cmd1 as! AnyHashable) {
//                return false
            }
        }

        return false
    }
}
