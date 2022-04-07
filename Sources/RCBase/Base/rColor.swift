//  rColor
//  Color.swift
//  base
//
//  Created by 林小鹏 on 2021/12/7.
//

import Foundation
import UIKit

public struct rColor {
    /// RGB的颜色设置
    public static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }

    /// RGBA的颜色设置
    public static func rgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }

    /// 16位 颜色设置
    public static func hexa(hexValue: Int, a: CGFloat) -> (UIColor) {
        return UIColor(red: (CGFloat)((hexValue & 0xFF0000) >> 16) / 255.0,
                       green: (CGFloat)((hexValue & 0xFF00) >> 8) / 255.0,
                       blue: (CGFloat)(hexValue & 0xFF) / 255.0,
                       alpha: a)
    }

    /// 16位 颜色设置
    public static func hex(hexValue: Int) -> (UIColor) {
        return hexa(hexValue: hexValue, a: 1.0)
    }
}
