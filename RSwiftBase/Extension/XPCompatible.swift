//
//  XPCompatible.swift
//  RSwiftBase
//
//  Created by 林小鹏 on 2022/7/16.
//

import Foundation
public struct XP<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

public protocol XPCompatible {}

public extension XPCompatible {
    static var xp: XP<Self>.Type {
        get { XP<Self>.self }
        set {}
    }

    var xp: XP<Self> {
        get { XP(self) }
        set {}
    }
}
