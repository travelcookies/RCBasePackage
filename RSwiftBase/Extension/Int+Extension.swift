//
//  Int+Extension.swift
//  YiShouKuan
//
//  Created by nbfujx on 2019/7/12.
//  Copyright © 2019 ningbokubin. All rights reserved.
//

import UIKit

public extension Int {
    /// 金额 - Int 转 String
    /// - Returns:  String?
    func fen2YuanDecimalFormatterValue() -> String? {
        let decimal = self % 100
        let nonDecimal = self / 100
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let title = formatter.string(from: NSNumber(value: nonDecimal)) {
            return title + String(format: ".%02d", decimal)
        }
        return nil
    }
}
