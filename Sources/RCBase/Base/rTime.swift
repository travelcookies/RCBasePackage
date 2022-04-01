//
//  File.swift
//
//
//  Created by 林小鹏 on 2022/3/29.
//

import Foundation

struct rTime {
    // 返回最近的天数
    static func returnNearByMonth(count: Int) -> [String] {
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
    static func returnNearByYear(count: Int) -> [String] {
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
    static func returnYear() -> String {
        let date = Date()
        let calendar = Calendar.current
        let unitFlags: NSCalendar.Unit = [NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day, NSCalendar.Unit.hour, NSCalendar.Unit.minute]
        let comp = (calendar as NSCalendar).components(unitFlags, from: date)
        let year = String(format: "%d", comp.year!)
        return "\(year)"
    }

    // 转换时间戳
    static func dateTimeYYYYMMDD(time: Int64, formatString: String? = "yyyy.MM.dd") -> String {
        let format = DateFormatter()
        format.dateFormat = formatString
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        return format.string(from: date)
    }


    /// 时间转换成时间戳  默认格式:yyyy-MM-dd HH:mm:ss
    static func dateTimeYYYYMMDD(string: String, formatString: String? = "yyyy-MM-dd HH:mm:ss") -> TimeInterval {
        let format = DateFormatter()
        format.dateFormat = formatString
        format.locale = Locale(identifier: "zh_CN")
        let willDate = format.date(from: string)!
        return willDate.timeIntervalSince1970
    }

    // 返回年月日
    static func returnMonthDayHourMinute(timeStr: String) -> String {
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

    

}
