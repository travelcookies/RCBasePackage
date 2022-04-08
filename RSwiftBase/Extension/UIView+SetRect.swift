//
//  UIView+SetRect.swift
//  YiShouKuan
//
//  Created by nbfujx on 2019/5/9.
//  Copyright © 2019 ningbokubin. All rights reserved.
//

import UIKit

public extension UIView {
    /// 坐标 x
    var x: CGFloat {
        get {
            return frame.origin.x
        }

        set(newVal) {
            var tmpFrame: CGRect = frame
            tmpFrame.origin.x = newVal
            frame = tmpFrame
        }
    }

    /// 坐标 y
    var y: CGFloat {
        get {
            return frame.origin.y
        }

        set(newVal) {
            var tmpFrame: CGRect = frame
            tmpFrame.origin.y = newVal
            frame = tmpFrame
        }
    }

    /// 高度 height
    var height: CGFloat {
        get {
            return frame.size.height
        }

        set(newVal) {
            var tmpFrame: CGRect = frame
            tmpFrame.size.height = newVal
            frame = tmpFrame
        }
    }

    /// 宽度 width
    var width: CGFloat {
        get {
            return frame.size.width
        }

        set(newVal) {
            var tmpFrame: CGRect = frame
            tmpFrame.size.width = newVal
            frame = tmpFrame
        }
    }

    /// left
    var left: CGFloat {
        get {
            return x
        }

        set(newVal) {
            x = newVal
        }
    }

    /// right
    var right: CGFloat {
        get {
            return x + width
        }

        set(newVal) {
            x = newVal - width
        }
    }

    /// top
    var top: CGFloat {
        get {
            return y
        }

        set(newVal) {
            y = newVal
        }
    }

    /// bottom
    var bottom: CGFloat {
        get {
            return y + height
        }

        set(newVal) {
            y = newVal - height
        }
    }

    /// 中心点坐标 X轴
    var centerX: CGFloat {
        get {
            return center.x
        }

        set(newVal) {
            center = CGPoint(x: newVal, y: center.y)
        }
    }

    /// 中心点坐标 Y轴
    var centerY: CGFloat {
        get {
            return center.y
        }

        set(newVal) {
            center = CGPoint(x: center.x, y: newVal)
        }
    }

    /// 宽度中点 X
    var middleX: CGFloat {
        return width / 2
    }

    /// 高度中点 Y
    var middleY: CGFloat {
        return height / 2
    }

    /// 中点
    var middlePoint: CGPoint {
        return CGPoint(x: middleX, y: middleY)
    }
}
