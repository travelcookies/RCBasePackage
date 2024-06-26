//
//  Async.swift
//  RSwiftBase
//
//  Created by 林小鹏 on 2022/6/30.
//

import Foundation

public struct Async {
    public typealias Task = () -> Void

    /// 异步
    /// - Parameter task: 闭包
    public static func async(_ task: @escaping Task) {
        _async(task)
    }

    /// 异步
    /// - Parameters:
    ///   - task: 异步线程 闭包
    ///   - mainTask: 主线程 闭包
    public static func async(_ task: @escaping Task, _ mainTask: @escaping Task) {
        _async(task, mainTask)
    }

    /// 私有:异步
    /// - Parameters:
    ///   - task: 异步线程 闭包
    ///   - mainTask: 主线程 闭包
    private static func _async(_ task: @escaping Task, _ mainTask: Task? = nil) {
        let item = DispatchWorkItem(block: task)
        DispatchQueue.global().async(execute: item)
        if let main = mainTask {
            item.notify(queue: DispatchQueue.main, execute: main)
        }
    }

    /// ##延迟

    @discardableResult
    /// 延迟
    /// - Parameters:
    ///   - seconds: 秒
    ///   - task: 闭包: 异步
    /// - Returns: dispatchWorkItem
    public static func asyncDelay(_ seconds: Double, _ task: @escaping Task) -> DispatchWorkItem {
        return _asyncDelay(seconds, task)
    }

    @discardableResult
    /// 延迟
    /// - Parameters:
    ///   - seconds: 秒
    ///   - task: 闭包: 异步
    ///   - mainTask: 闭包:main
    /// - Returns: dispatchWorkItem
    public static func asyncDelay(_ seconds: Double, _ task: @escaping Task, _ mainTask: @escaping Task) -> DispatchWorkItem {
        return _asyncDelay(seconds, task, mainTask)
    }

    /// 延迟:私有
    /// - Parameters:
    ///   - seconds: 秒
    ///   - task: 闭包: 异步
    ///   - mainTask: 闭包:main 可选
    /// - Returns: dispatchWorkItem
    private static func _asyncDelay(_ seconds: Double, _ task: @escaping Task, _ mainTask: Task? = nil) -> DispatchWorkItem {
        let itme = DispatchWorkItem(block: task)
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + seconds, execute: itme)

        if let main = mainTask {
            itme.notify(queue: DispatchQueue.main, execute: main)
        }

        return itme
    }
}
