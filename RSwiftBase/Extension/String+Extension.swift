//
//  String+Extension.swift
//  SZParking
//
//  Created by nbfujx on 2020/10/30.
//  Copyright © 2020 ningbokubin. All rights reserved.
//

import CommonCrypto
import Foundation
import UIKit
extension String: XPCompatible {}

public extension XP where Base == String {
    /// MD5
    var md5: String {
        let ccharArray = base.cString(using: String.Encoding.utf8)
        var uint8Array = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(ccharArray, CC_LONG(ccharArray!.count - 1), &uint8Array)
        return uint8Array.reduce("") { $0 + String(format: "%02X", $1) }
    }

    /// 将原始的url编码为合法的url
    /// - Returns: String
    func urlEncoded() -> String {
        let encodeUrlString = base.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }

    /// 将编码后的url转换回原始的url
    /// - Returns: String
    func urlDecoded() -> String {
        return base.removingPercentEncoding ?? ""
    }

    /// json字符串转字典
    /// - Returns: [String: Any?]
    func toDictionary() -> [String: Any?] {
        var result = [String: Any]()
        guard !base.isEmpty else { return result }

        guard let dataSelf = base.data(using: .utf8) else {
            return result
        }

        if let dic = try? JSONSerialization.jsonObject(with: dataSelf,
                                                       options: .mutableContainers) as? [String: Any] {
            result = dic
        }
        return result
    }

    /// 下标
    subscript(r: Range<Int>) -> String {
        let beginIndex = base.index(base.startIndex, offsetBy: r.startIndex)
        let endIndex = base.index(base.startIndex, offsetBy: r.endIndex)
        return String(base[beginIndex ..< endIndex])
    }
}

/// Test Size
public extension XP where Base == String {
    /// 计算宽度
    /// - Parameters:
    ///   - fontSize: CGFloat
    ///   - height: CGFloat = 15
    /// - Returns: 宽度
    func widthForComment(fontSize: CGFloat, height: CGFloat = 15) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: base).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.width)
    }

    /// 计算高度
    /// - Parameters:
    ///   - fontSize: CGFloat
    ///   - width: CGFloat
    /// - Returns: CGFloat 高度
    func heightForComment(fontSize: CGFloat, width: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: base).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.height)
    }

    /// 计算高度
    /// - Parameters:
    ///   - fontSize: CGFloat
    ///   - width: CGFloat
    ///   - maxHeight: CGFloat
    /// - Returns: CGFloat 高度
    func heightForComment(fontSize: CGFloat, width: CGFloat, maxHeight: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: base).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.height) > maxHeight ? maxHeight : ceil(rect.height)
    }
}
