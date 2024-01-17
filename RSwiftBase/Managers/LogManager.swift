//
//  LogManager.swift
//  SwiftHub
//
//  Created by Khoren Markosyan on 1/4/17.
//  Copyright © 2017 Khoren Markosyan. All rights reserved.
//

import Foundation
import CocoaLumberjack
import RxSwift

public func logDebug(_ message: @autoclosure () -> DDLogMessageFormat) {
    DDLogDebug(message())
 }

public func logError(_ message: @autoclosure () -> DDLogMessageFormat) {
    DDLogError(message())
}

public func logInfo(_ message: @autoclosure () -> DDLogMessageFormat) {
    DDLogInfo(message())
}

public func logVerbose(_ message: @autoclosure () -> DDLogMessageFormat) {
    DDLogVerbose(message())
}

public func logWarn(_ message: @autoclosure () -> DDLogMessageFormat) {
    DDLogWarn(message())
}

public func logResourcesCount() {
    logDebug("swsw")
//    #if DEBUG
//    logDebug("RxSwift resources count: \(RxSwift.Resources.total)")
//    #endif
}
