//
//  NSInteger+Extension.swift
//  SZParking
//
//  Created by nbfujx on 2020/8/24.
//  Copyright © 2020 ningbokubin. All rights reserved.
//

import Foundation

public extension NSInteger {
    func timeToStringFormatterValue() -> String {
        if self < 60 {
            return String(format: "%d秒", self)
        }
        if self >= 60 && self < 60 * 60 {
            return String(format: "%d分钟%d秒", self / 60, self % 60)
        }
        if self >= 60 * 60 {
            return String(format: "%d小时%d分钟%d秒", self / (60 * 60), (self % (60 * 60)) / 60, ((self % (60 * 60)) / 60) % 60)
        }
        return "0秒"
    }
}
