//
//  BaseR.swift
//  RSwiftBaseTests
//
//  Created by 林小鹏 on 2022/8/2.
//

import RSwiftBase
import UIKit
import XCTest

class BaseR: XCTestCase {
    func testW() {
        let base = "<p><img src=\"http://img.shengzhouchengtou.com/167834225642688ad13afa5904421977f732361c69d20\" style=\"width:790px;height:672.2px\" /><img src=\"http://img.shengzhouchengtou.com/167834226693290218ed089144f5f951181cc7737b6b9\" /><img src=\"http://img.shengzhouchengtou.com/1678342272851e0db65b28b854ec88c1843ea3e83c0ab\" /><img src=\"http://img.shengzhouchengtou.com/1678342278501507a61dd59484902a607f0657280b012\" /><img src=\"http://img.shengzhouchengtou.com/1678342284866479a517fdf3c4fcdb00c5a5996863c7e\" /><img src=\"http://img.shengzhouchengtou.com/16783422909488975d747161d4ff38a8d74c305ed999c\" /><img src=\"http://img.shengzhouchengtou.com/167834231746675e987792c8f4b76b8dbdb426cf13ad2\" /><img src=\"http://img.shengzhouchengtou.com/16783423323979ac893ba2e504b42992eb4554a642df3\" /></p>"

        let numbers = base.components(separatedBy: ["\"", "\""])
        var imgs: [String] = []
        numbers.forEach { data in
            if data.hasPrefix("http") {
                imgs.append(data)
            }
        }
        print(numbers)
        print(imgs)
    }

    func testW1() {
        let base = "<p><img src=\"http://img.shengzhouchengtou.com/167834225642688ad13afa5904421977f732361c69d20\" style=\"width:790px;height:672.2px\" /><img src=\"http://img.shengzhouchengtou.com/167834226693290218ed089144f5f951181cc7737b6b9\" /><img src=\"http://img.shengzhouchengtou.com/1678342272851e0db65b28b854ec88c1843ea3e83c0ab\" /><img src=\"http://img.shengzhouchengtou.com/1678342278501507a61dd59484902a607f0657280b012\" /><img src=\"http://img.shengzhouchengtou.com/1678342284866479a517fdf3c4fcdb00c5a5996863c7e\" /><img src=\"http://img.shengzhouchengtou.com/16783422909488975d747161d4ff38a8d74c305ed999c\" /><img src=\"http://img.shengzhouchengtou.com/167834231746675e987792c8f4b76b8dbdb426cf13ad2\" /><img src=\"http://img.shengzhouchengtou.com/16783423323979ac893ba2e504b42992eb4554a642df3\" /></p>"

        let numbers = base.components(separatedBy: [" "])
        var newHtml: String = ""
        numbers.forEach { data in
            if !data.hasPrefix("style") {
                newHtml += " \(data)"
            }
        }
        print(newHtml)
    }

    func testW2() {
        let base = "{\"angle\":0,\"stops\":[[\"#03B562FF\",0],[\"#8DF601FF\",1]],\"type\":\"linear\"}"

        let numbers = base.components(separatedBy: ["\""])
        var newHtml: String = ""
        numbers.forEach { data in
            if data.hasPrefix("#") {
                newHtml += " \(data)"
            }
        }
        print(newHtml)
    }

    func testW3() {
        let base = "data:image/png;base64,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"

        let numbers = base.components(separatedBy: [","])
        var newHtml: String = ""
        numbers.forEach { data in
            if !data.hasPrefix("data") {
                newHtml += "\(data)"
            }
        }
        print(newHtml)
    }

    func testW4() {
        let num = 8 / 3 + 1
        let buttonWidth = 40.0
        let height = buttonWidth * Double(num) + Double(num - 1) * 20
        print(height)
    }

    func testW5() {
//        let dict: [String: Any] = ["payAmount": 0.00]
//
////        guard let dict = response as? [String: Any] else {
////            return
////        }
//
//        guard let payAmount = dict["payAmount"] else {
//            print("payAmount_no")
//            return
//        }
//        let double = String(payAmount)
//        print("payAmount", payAmount)
    }
}
