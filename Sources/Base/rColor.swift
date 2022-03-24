//  rColor
//  Color.swift
//  base
//
//  Created by 林小鹏 on 2021/12/7.
//

import Foundation
import UIKit

struct rColor {
    /// RGBA的颜色设置
    static func RGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }

    static func RGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }

    static func HEXA(hexValue: Int, a: CGFloat) -> (UIColor) {
        return UIColor(red: (CGFloat)((hexValue & 0xFF0000) >> 16) / 255.0,
                       green: (CGFloat)((hexValue & 0xFF00) >> 8) / 255.0,
                       blue: (CGFloat)(hexValue & 0xFF) / 255.0,
                       alpha: a)
    }

    static func RGB0X(hexValue: Int) -> (UIColor) {
        return HEXA(hexValue: hexValue, a: 1.0)
    }
}
///App常用 特定颜色
extension rColor {
    
}
