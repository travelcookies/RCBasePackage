//
//  NibLoadable.swift
//  NodeStore
//
//  Created by 林小鹏 on 2022/5/5.
//
import Foundation
import UIKit

extension UIView: XPCompatible {}

public extension XP where Base == UIView {
    static func loadFromNib(_ nibname: String? = nil) -> Self { // Self (大写) 当前类对象
        // self(小写) 当前对象
        let loadName = nibname == nil ? "\(self)" : nibname!

        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
}

public extension XP where Base: UIView {
    ///  添加圆角 某个方向
    /// - Parameters:
    ///   - conrners: UIRectCorner: topLeft,topRight,bottomLeft,bottomRight,allCorners;
    ///   - radius: radius 数值
    func addCorner(conrners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: base.bounds, byRoundingCorners: conrners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = base.bounds
        maskLayer.path = maskPath.cgPath
        base.layer.mask = maskLayer
    }

    /// 添加圆角 某个方向
    /// - Parameters:
    ///   - conrners: UIRectCorner: topLeft,topRight,bottomLeft,bottomRight,allCorners;
    ///   - radius: radius 数值
    ///   - roundedRect: CGRect
    func addCorner(conrners: UIRectCorner, radius: CGFloat, _ roundedRect: CGRect) {
        let maskPath = UIBezierPath(roundedRect: roundedRect, byRoundingCorners: conrners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = base.bounds
        maskLayer.path = maskPath.cgPath
        base.layer.mask = maskLayer
    }

    /// 坐标 x
    var x: CGFloat {
        get {
            return base.frame.origin.x
        }

        set(newVal) {
            var tmpFrame: CGRect = base.frame
            tmpFrame.origin.x = newVal
            base.frame = tmpFrame
        }
    }

    /// 坐标 y
    var y: CGFloat {
        get {
            return base.frame.origin.y
        }

        set(newVal) {
            var tmpFrame: CGRect = base.frame
            tmpFrame.origin.y = newVal
            base.frame = tmpFrame
        }
    }

    /// 高度 height
    var height: CGFloat {
        get {
            return base.frame.size.height
        }

        set(newVal) {
            var tmpFrame: CGRect = base.frame
            tmpFrame.size.height = newVal
            base.frame = tmpFrame
        }
    }

    /// 宽度 width
    var width: CGFloat {
        get {
            return base.frame.size.width
        }

        set(newVal) {
            var tmpFrame: CGRect = base.frame
            tmpFrame.size.width = newVal
            base.frame = tmpFrame
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
            return base.center.x
        }

        set(newVal) {
            base.center = CGPoint(x: newVal, y: base.center.y)
        }
    }

    /// 中心点坐标 Y轴
    var centerY: CGFloat {
        get {
            return base.center.y
        }

        set(newVal) {
            base.center = CGPoint(x: base.center.x, y: newVal)
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
