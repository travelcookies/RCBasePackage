//
//  Log.swift
//  RSwiftBase
//
//  Created by 林小鹏 on 2022/7/18.
//

import Foundation

public struct R {
    public static func log(_ items: Any..., separator: String = " ", _ file: String = #file, funcName: String = #function, lineNum: Int = #line) {
        #if DEBUG
            let fileName = (file as NSString).lastPathComponent
            debugPrint("\(fileName):(\(lineNum))", items)

        #endif
    }
}
