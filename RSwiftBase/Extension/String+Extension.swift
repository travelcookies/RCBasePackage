//
//  String+Extension.swift
//  SZParking
//
//  Created by nbfujx on 2020/10/30.
//  Copyright © 2020 ningbokubin. All rights reserved.
//

import CommonCrypto
import Foundation

public extension String {
    /// MD5
    var md5: String {
        let ccharArray = cString(using: String.Encoding.utf8)
        var uint8Array = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(ccharArray, CC_LONG(ccharArray!.count - 1), &uint8Array)
        return uint8Array.reduce("") { $0 + String(format: "%02X", $1)
        }
    }

    /// 将原始的url编码为合法的url
    /// - Returns: String
    func urlEncoded() -> String {
        let encodeUrlString = addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }

    /// 将编码后的url转换回原始的url
    /// - Returns: String
    func urlDecoded() -> String {
        return removingPercentEncoding ?? ""
    }

    /// json字符串转字典
    /// - Returns: [String: Any?]
    func toDictionary() -> [String: Any?] {
        var result = [String: Any]()
        guard !isEmpty else { return result }

        guard let dataSelf = data(using: .utf8) else {
            return result
        }

        if let dic = try? JSONSerialization.jsonObject(with: dataSelf,
                                                       options: .mutableContainers) as? [String: Any] {
            result = dic
        }
        return result
    }

    subscript(r: Range<Int>) -> String {
        let beginIndex = index(startIndex, offsetBy: r.startIndex)
        let endIndex = index(startIndex, offsetBy: r.endIndex)
        return String(self[beginIndex ..< endIndex])
    }
}
