//
//  Int+Extension.swift
//  YiShouKuan
//
//  Created by nbfujx on 2019/7/12.
//  Copyright © 2019 ningbokubin. All rights reserved.
//

import UIKit

extension Int: XPCompatible {}

public extension XP where Base == Int {
    /// 金额 - Int 转 String
    /// - Returns:  String?
    @discardableResult func fen2YuanDecimalFormatterValue() -> String? {
        let decimal = base % 100
        let nonDecimal = base / 100
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let title = formatter.string(from: NSNumber(value: nonDecimal)) {
            return title + String(format: ".%02d", decimal)
        }
        return nil
    }

    /// 时分秒 转 String
    /// - Returns: String
    func timeToStringFormatterValue() -> String {
        if base < 60 {
            return String(format: "%d秒", base)
        }
        if base >= 60 && base < 60 * 60 {
            return String(format: "%d分钟%d秒", base / 60, base % 60)
        }
        if base >= 60 * 60 {
            return String(format: "%d小时%d分钟%d秒", base / (60 * 60), (base % (60 * 60)) / 60, ((base % (60 * 60)) / 60) % 60)
        }
        return "0秒"
    }
}

/// Color
public extension XP where Base == Int {
    /// 16位 颜色设置
    /// - Returns: UIColor
    var hex: UIColor {
        hexa(1.0)
    }

    func hexa(_ a: CGFloat) -> UIColor {
        UIColor(red: (CGFloat)((base & 0xFF0000) >> 16) / 255.0,
                green: (CGFloat)((base & 0xFF00) >> 8) / 255.0,
                blue: (CGFloat)(base & 0xFF) / 255.0,
                alpha: a)
    }
}
