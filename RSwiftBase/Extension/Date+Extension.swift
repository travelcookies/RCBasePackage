//
//  Date+Extension.swift
//  YiShouKuan
//
//  Created by nbfujx on 2019/5/16.
//  Copyright © 2019 ningbokubin. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 获取日期各种值

extension Date: XPCompatible {}

extension XP where Base == Date {
    /// 获取年份
    var year: Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: base)
        return com.year!
    }

    /// 获取-月份
    var month: Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: base)
        return com.month!
    }

    /// 获取 日 本月第几天
    var day: Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: base)
        return com.day!
    }

    /// 星期几
    var weakDay: Int {
        let interval = Int(base.timeIntervalSince1970)
        let days = Int(interval / 86400) // 24*60*60
        let weekday = ((days + 4) % 7 + 7) % 7
        return weekday == 0 ? 7 : weekday
    }

    /// 当月天数
    var currentMonthNumber: Int {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: base)
        return (range?.length)!
    }

    /// 当月第一天是星期几
    var firstWeekDay: Int {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let firstWeekDay = (calendar as NSCalendar?)?.ordinality(of: NSCalendar.Unit.weekday, in: NSCalendar.Unit.weekOfMonth, for: base)
        return firstWeekDay! - 1
    }

    // MARK: - 日期的一些比较

    /// 是否是今天
    var isToday: Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: base)
        let comNow = calendar.dateComponents([.year, .month, .day], from: Date())
        return com.year == comNow.year && com.month == comNow.month && com.day == comNow.day
    }

    /// 是否是这个月
    var isCurrentMonth: Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: base)
        let comNow = calendar.dateComponents([.year, .month, .day], from: Date())
        return com.year == comNow.year && com.month == comNow.month
    }

    /// 获取当前 秒级 时间戳 - 10位

    var timeStamp: String {
        let timeInterval: TimeInterval = base.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)"
    }

    /// 获取当前 毫秒级 时间戳 - 13位
    var milliStamp: String {
        let timeInterval: TimeInterval = base.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval * 1000))
        return "\(millisecond)"
    }
}

public extension Date {
    /// 获取年份
    /// - Returns: Int
    func year() -> Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: self)
        return com.year!
    }

    /// 获取-月份
    /// - Returns: Int
    func month() -> Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: self)
        return com.month!
    }

    /// 获取 日 本月第几天
    /// - Returns: Int
    func day() -> Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: self)
        return com.day!
    }

    /// 星期几
    /// - Returns: Int
    func weekDay() -> Int {
        let interval = Int(timeIntervalSince1970)
        let days = Int(interval / 86400) // 24*60*60
        let weekday = ((days + 4) % 7 + 7) % 7
        return weekday == 0 ? 7 : weekday
    }

    /// 当月天数
    /// - Returns: Int
    func countOfDaysInMonth() -> Int {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: self)
        return (range?.length)!
    }

    /// 当月第一天是星期几
    /// - Returns: Int
    func firstWeekDay() -> Int {
        // 1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let firstWeekDay = (calendar as NSCalendar?)?.ordinality(of: NSCalendar.Unit.weekday, in: NSCalendar.Unit.weekOfMonth, for: self)
        return firstWeekDay! - 1
    }

    // MARK: - 日期的一些比较

    /// 是否是今天
    /// - Returns: Bool
    func isToday() -> Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: self)
        let comNow = calendar.dateComponents([.year, .month, .day], from: Date())
        return com.year == comNow.year && com.month == comNow.month && com.day == comNow.day
    }

    /// 是否是这个月
    /// - Returns: Bool
    func isThisMonth() -> Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: self)
        let comNow = calendar.dateComponents([.year, .month, .day], from: Date())
        return com.year == comNow.year && com.month == comNow.month
    }

    /// 获取当前 秒级 时间戳 - 10位
    var timeStamp: String {
        let timeInterval: TimeInterval = timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)"
    }

    /// 获取当前 毫秒级 时间戳 - 13位
    var milliStamp: String {
        let timeInterval: TimeInterval = timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval * 1000))
        return "\(millisecond)"
    }
}
