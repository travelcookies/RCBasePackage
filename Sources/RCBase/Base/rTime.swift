//
//  File.swift
//
//
//  Created by 林小鹏 on 2022/3/29.
//

import Foundation

struct rTime {
    // 返回最近的天数
    public static func returnNearByMonth(count: Int) -> [String] {
        let time = Date().timeIntervalSince1970
        var arr = [String]()

        for i in 0 ..< count {
            let timeNow = time - TimeInterval(i * 3600 * 24)
            let date = Date(timeIntervalSince1970: timeNow)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd"
            let str = dateFormatter.string(from: date)
            arr.append(str)
        }

        return arr.reversed()
    }

    // 返回最近的月数
    public static func returnNearByYear(count: Int) -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        let str = dateFormatter.string(from: Date())
        var month = Int(str)!
        var year = Int(rTime.returnYear())!
        var arr = [String]()
        for _ in 0 ..< count {
            if month == 0 {
                month = 12
                year -= 1
            }
            arr.append("\(year)-\(String(format: "%02d", month))")
            month -= 1
        }

        return arr
    }

    // 返回年
    public static func returnYear() -> String {
        let date = Date()
        let calendar = Calendar.current
        let unitFlags: NSCalendar.Unit = [NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day, NSCalendar.Unit.hour, NSCalendar.Unit.minute]
        let comp = (calendar as NSCalendar).components(unitFlags, from: date)
        let year = String(format: "%d", comp.year!)
        return "\(year)"
    }

    // 转换时间戳
    public static func dateTimeYYYYMMDD(time: Int64, formatString: String? = "yyyy.MM.dd") -> String {
        let format = DateFormatter()
        format.dateFormat = formatString
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        return format.string(from: date)
    }

    /// 时间转换成时间戳  默认格式:yyyy-MM-dd HH:mm:ss
    public static func dateTimeYYYYMMDD(string: String, formatString: String? = "yyyy-MM-dd HH:mm:ss") -> TimeInterval {
        let format = DateFormatter()
        format.dateFormat = formatString
        format.locale = Locale(identifier: "zh_CN")
        let willDate = format.date(from: string)!
        return willDate.timeIntervalSince1970
    }

    // 返回年月日
    public static func returnMonthDayHourMinute(timeStr: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "zh_CN")

        let date = dateFormatter.date(from: timeStr)
        let calendar = Calendar.current
        let unitFlags: NSCalendar.Unit = [NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day, NSCalendar.Unit.hour, NSCalendar.Unit.minute]
        let comp = (calendar as NSCalendar).components(unitFlags, from: date!)
        let month = String(format: "%02d", comp.month!)
        let day = String(format: "%02d", comp.day!)
        let hour = String(format: "%02d", comp.hour!)
        let minute = String(format: "%02d", comp.minute!)
        return "\(month)月\(day)日\(hour):\(minute)"
    }

    // MARK: - 当前时间相关

    // MARK: 今年

    public static func currentYear() -> Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: Date())
        return com.year!
    }

    // MARK: 今月

    public static func currentMonth() -> Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: Date())
        return com.month!
    }

    // MARK: 今日

    public static func currentDay() -> Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: Date())
        return com.day!
    }

    // 获取当前日期(年-月)
    public static func currentDateMM() -> String {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: Date())
        return String(format: "%d-%02d", com.year!, com.month!)
    }

    // 获取当前日期(年-月-日)
    public static func currentDate() -> String {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: Date())
        return String(format: "%d-%02d-%02d", com.year!, com.month!, com.day!)
    }

    // 获取当前日期(年-月-日 时:分:秒)
    public static func currentDetailsDate() -> String {
        let currStamp = getStamp()
        return timeStampToStringDetail(String(format: "%d", currStamp))
    }

    // MARK: 今天星期几

    public static func currentWeekDay() -> Int {
        return rTime.weekDay(Date())
    }

    // MARK: 星期几

    public static func weekDay(_ date: Date) -> Int {
        let interval = Int(date.timeIntervalSince1970)
        let days = Int(interval / 86400) // 24*60*60
        let weekday = ((days + 4) % 7 + 7) % 7
        return weekday == 0 ? 7 : weekday
    }

    // MARK: 星期几

    public static func weekdayStringWithDate(_ date: Date) -> String {
        let componets = NSCalendar.current.component(.weekday, from: date)
//        let weakday = componets.hashValue
        let m = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]

        return m[componets - 1]
    }

    // MARK: 本月天数

    public static func countOfDaysInCurrentMonth() -> Int {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: Date())
        return (range?.length)!
    }

    // MARK: 当月第一天是星期几

    public static func firstWeekDayInCurrentMonth() -> Int {
        // 星期和数字一一对应 星期日：7
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let date = dateFormatter.date(from: String(Date().year()) + "-" + String(Date().month()))
        let calender = Calendar(identifier: Calendar.Identifier.gregorian)
        let comps = (calender as NSCalendar?)?.components(NSCalendar.Unit.weekday, from: date!)
        var week = comps?.weekday
        if week == 1 {
            week = 8
        }
        return week! - 1
    }

    // MARK: - 获取指定日期各种值

    // 根据年月得到某月天数
    public static func getCountOfDaysInMonth(year: Int, month: Int) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let date
            = dateFormatter.date(from: String(year) + "-" + String(month))
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: date!)
        return (range?.length)!
    }

    // MARK: 根据年月得到某月第一天是周几

    public static func getfirstWeekDayInMonth(year: Int, month: Int) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let date
            = dateFormatter.date(from: String(year) + "-" + String(month))
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let comps = (calendar as NSCalendar?)?.components(NSCalendar.Unit.weekday, from: date!)
        let week = comps?.weekday
        return week! - 1
    }

    // MARK: date转日期字符串

    public static func dateToDateString(_ date: Date, dateFormat: String) -> String {
        let timeZone = NSTimeZone.local
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.dateFormat = dateFormat

        let date = formatter.string(from: date)
        return date
    }

    // MARK: 日期字符串转date

    public static func dateStringToDate(_ dateStr: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date
            = dateFormatter.date(from: dateStr)
        return date!
    }

    // MARK: 时间字符串转date

    public static func timeStringToDate(_ dateStr: String) -> Date {
        let dateFormatter = DateFormatter()
        //        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm:ss"
        let date = dateFormatter.date(from: dateStr)
        return date!
    }

    // MARK: 计算天数差

    public static func dateDifference(_ dateA: Date, from dateB: Date) -> Double {
        let interval = dateA.timeIntervalSince(dateB)
        return interval / 86400
    }

    // MARK: 比较时间先后

    public static func compareOneDay(oneDay: Date, withAnotherDay anotherDay: Date) -> Int {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let oneDayStr: String = dateFormatter.string(from: oneDay)
        let anotherDayStr: String = dateFormatter.string(from: anotherDay)
        let dateA = dateFormatter.date(from: oneDayStr)
        let dateB = dateFormatter.date(from: anotherDayStr)
        let result: ComparisonResult = (dateA?.compare(dateB!))!
        // Date1  is in the future
        if result == ComparisonResult.orderedDescending {
            return 1
        }
        // Date1 is in the past
        else if result == ComparisonResult.orderedAscending {
            return 2
        }
        // Both dates are the same
        else {
            return 0
        }
    }

    // MARK: 时间与时间戳之间的转化

    // 将时间转换为时间戳
    public static func stringToTimeStamp(_ stringTime: String) -> Int {
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        dfmatter.locale = Locale.current

        let date = dfmatter.date(from: stringTime)

        let dateStamp: TimeInterval = date!.timeIntervalSince1970

        let dateSt: Int = Int(dateStamp)

        return dateSt
    }

    // 将时间戳转换为年月日
    public static func timeStampToString(_ timeStamp: String) -> String {
        let string = NSString(string: timeStamp)
        let timeSta: TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }

    // 将时间戳转换为具体时间
    public static func timeStampToStringDetail(_ timeStamp: String) -> String {
        let string = NSString(string: timeStamp)
        let timeSta: TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }

    // 将时间戳转换为具体时间时分
    public static func timeStampToStringDetailHHMM(_ timeStamp: String) -> String {
        let string = NSString(string: timeStamp)
        let timeSta: TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }

    // 将时间戳转换为时分秒
    public static func timeStampToHHMMSS(_ timeStamp: String) -> String {
        let string = NSString(string: timeStamp)
        let timeSta: TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "HH:mm:ss"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }

    // 将时间戳转换为时分
    public static func timeStampToHHMM(_ timeStamp: String) -> String {
        let string = NSString(string: timeStamp)
        let timeSta: TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "HH:mm"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }

    // 获取系统的当前时间戳
    public static func getStamp() -> Int {
        // 获取当前时间戳
        let date = Date()
        let timeInterval: Int = Int(date.timeIntervalSince1970)
        return timeInterval
    }

    // 月份数字转汉字
    public static func numberToChina(monthNum: Int) -> String {
        let ChinaArray = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
        let ChinaStr: String = ChinaArray[monthNum - 1]
        return ChinaStr
    }

    // MARK: 数字前补0

    public static func add0BeforeNumber(_ number: Int) -> String {
        if number >= 10 {
            return String(number)
        } else {
            return "0" + String(number)
        }
    }

    // MARK: 将时间显示为（几分钟前，几小时前，几天前）

    public static func compareCurrentTime(str: String) -> String {
        let timeDate = timeStringToDate(str)
        let currentDate = NSDate()
        let timeInterval = currentDate.timeIntervalSince(timeDate)
        var temp: Double = 0
        var result: String = ""
        if timeInterval / 60 < 1 {
            result = String(timeInterval)
        } else if (timeInterval / 60) < 60 {
            temp = timeInterval / 60
            result = "\(Int(temp))分钟前"
        } else if timeInterval / 60 / 60 < 24 {
            temp = timeInterval / 60 / 60
            result = "\(Int(temp))小时前"
        } else if timeInterval / (24 * 60 * 60) < 30 {
            temp = timeInterval / (24 * 60 * 60)
            result = "\(Int(temp))天前"
        } else if timeInterval / (30 * 24 * 60 * 60) < 12 {
            temp = timeInterval / (30 * 24 * 60 * 60)
            result = "\(Int(temp))个月前"
        } else {
            temp = timeInterval / (12 * 30 * 24 * 60 * 60)
            result = "\(Int(temp))年前"
        }
        return result
    }

    // MARK: 计时

    public static func comparePastTime(startTime: String) -> String {
        // 1605161267000
        let timestamp = Date().timeIntervalSince1970
        let timeStamp2 = CLongLong(round(timestamp * 1000))
        let startTime2 = CLongLong(startTime)!
        let difference = CLongLong((timeStamp2 - startTime2) / 1000)

        var formattingStr = ""
        if difference < 60 {
            formattingStr = String(format: "00时00分%02d秒", difference)
        } else if difference >= 60 && difference < 3600 {
            let min = Int(difference / 60)
            let sec = difference - CLongLong(min * 60)
            formattingStr = String(format: "00时%02d分%02d秒", min, sec)
        } else {
            let hour = Int(difference / 3600)
            let min = Int((difference - CLongLong(hour * 60 * 60)) / 60)
            let sec = difference - CLongLong(hour * 60 * 60) - CLongLong(min * 60)
            formattingStr = String("\(hour)时\(min)分\(sec)秒")
            formattingStr = String(format: "%d时%02d分%02d秒", hour, min, sec)
        }
        return formattingStr
    }

    /** 计算两个时间直接的间隔 */
    public static func durationBetween(beginTime: String, endTime: String) -> String {
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let bt = dfmatter.date(from: beginTime), let et = dfmatter.date(from: endTime) else {
            return ""
        }
        let timestamp = bt.timeIntervalSince1970
        let timeStamp2 = CLongLong(round(timestamp * 1000))
        let endTimeStamp = CLongLong(round(et.timeIntervalSince1970 * 1000))
        let difference = CLongLong((endTimeStamp - timeStamp2) / 1000)

        var formattingStr = ""
        if difference < 60 {
            formattingStr = String(format: "00时00分%02d秒", difference)
        } else if difference >= 60 && difference < 3600 {
            let min = Int(difference / 60)
            let sec = difference - CLongLong(min * 60)
            formattingStr = String(format: "00时%02d分%02d秒", min, sec)
        } else {
            let hour = Int(difference / 3600)
            let min = Int((difference - CLongLong(hour * 60 * 60)) / 60)
            let sec = difference - CLongLong(hour * 60 * 60) - CLongLong(min * 60)
            formattingStr = String("\(hour)时\(min)分\(sec)秒")
            formattingStr = String(format: "%d时%02d分%02d秒", hour, min, sec)
        }
        return formattingStr
    }
}
