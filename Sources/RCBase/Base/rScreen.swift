//
//  LayoutConfig.swift
//  base
//
//  Created by 林小鹏 on 2021/12/7.
//  屏幕;位置;

import Foundation
import UIKit

struct rScreen {
    static let bounds = UIScreen.main.bounds
    static let width = bounds.size.width
    static let height = bounds.size.height

    // 是否为刘海屏
    static var isFullScreen: Bool {
        if #available(iOS 11, *) {
            guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
                return false
            }

            if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
                print(unwrapedWindow.safeAreaInsets)
                return true
            }
        }
        return false
    }

    static var statusH: CGFloat {
        if iPhoneX {
            return 44
        }
        if #available(iOS 14, *) {
            return 48
        }
        return 44
    }
}

/// 根据高度 判断 机型
extension rScreen {
    static let iPhone4 = rScreen.height < 568 ? true : false
    static let iPhone5 = rScreen.height == 568 ? true : false
    static let iPhone6 = rScreen.height == 667 ? true : false
    static let iPhone6P = rScreen.height == 736 ? true : false
    static let iPhoneX = rScreen.height == 812 ? true : false

    static func isIPhoneX() -> Bool {
        if #available(iOS 11.0, *) {
            if let delegate = UIApplication.shared.delegate {
                if let window = delegate.window {
                    let safeAreaInsets = window?.safeAreaInsets
                    if let bottom = safeAreaInsets?.bottom {
                        if bottom > 0.0 {
                            return true
                        }
                    }
                }
            }
        }
        return false
    }
}

extension rScreen {
    /// statusHeight 状态栏高度
    static let statusHeight: CGFloat = isFullScreen ? statusH : 20
    // kNavBarHeight    导航栏高度
    static let naviBarHeight: CGFloat = 44
    // navigationBarHeight 状态栏 加 导航栏
    static let navigationBarHeight: CGFloat = statusHeight + naviBarHeight
    // tabBarHeight 底部导航栏高度
    static let tabBarHeight: CGFloat = isFullScreen ? 49 + 34 : 49
    // safeAreaBottom   安全范围底部高度
    static let safeAreaBottom: CGFloat = isFullScreen ? 34 : 0
    // safeAreaTop  安全范围头部高度
    static let safeAreaTop: CGFloat = isFullScreen ? 48 : 0
}
