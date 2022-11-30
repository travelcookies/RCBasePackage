//
//  UIColorExtention.swift
//  RSwiftBase
//
//  Created by 林小鹏 on 2022/11/30.
//

import UIKit

extension UIColor: XPCompatible {}

public extension XP where Base == UIColor {
    /// 将UIColor转换为16进制字符串。
    func toHexString() -> String {
        let components = base.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0

        let hexString = String(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        return hexString
    }

    /// 16位 颜色设置 string 字符段
    /// - Parameter hexValue: #232214 string 字符
    /// - Returns: UIColor
    static func hexa(hexValue: String, a: CGFloat) -> (UIColor) {
        let hex = (hexValue as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)

        if hex.hasPrefix("#") {
            scanner.scanLocation = 1
        }

        var color: UInt32 = 0
        scanner.scanHexInt32(&color)

        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0

        return UIColor(red: red, green: green, blue: blue, alpha: a)
    }

    static func hex(hexValue: String) -> (UIColor) {
        return hexa(hexValue: hexValue, a: 1.0)
    }
}
