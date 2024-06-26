//
//  UITableView+Ex.swift
//  SZParking
//
//  Created by 林小鹏 on 2023/3/11.
//  Copyright © 2023 ningbokubin. All rights reserved.
//

import Foundation
import UIKit
extension UITableView {
    func rTableView(willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath, _ radius: CGFloat = 8.0) {
        // 圆角弧度半径
        let cornerRadius: CGFloat = radius
        // 设置cell的背景色为透明，如果不设置这个的话，则原来的背景色不会被覆盖
        cell.backgroundColor = UIColor.clear
        // 创建一个shapeLayer
        let layer = CAShapeLayer()
        // 创建一个可变的图像Path句柄，该路径用于保存绘图信息
        let pathRef = CGMutablePath()
        // 获取cell的size
        // 第一个参数,是整个 cell 的 bounds, 第二个参数是距左右两端的距离,第三个参数是距上下两端的距离
        let bounds = cell.bounds.insetBy(dx: 16, dy: 0)
        // 用来显示中间线
        _ = false
        // CGRectGetMinY：返回对象顶点坐标
        // CGRectGetMaxY：返回对象底点坐标
        // CGRectGetMinX：返回对象左边缘坐标
        // CGRectGetMaxX：返回对象右边缘坐标
        // CGRectGetMidX: 返回对象中心点的X坐标
        // CGRectGetMidY: 返回对象中心点的Y坐标

        // 这里要判断分组列表中的第一行，每组section的第一行，每组section的中间行
        if indexPath.row == 0 && indexPath.row == numberOfRows(inSection: indexPath.section) - 1 {
            pathRef.addRoundedRect(in: bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius)
        } else if indexPath.row == 0 {
            pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.maxY), transform: .identity)
            pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.minY), tangent2End: CGPoint(x: bounds.midX, y: bounds.minY), radius: cornerRadius, transform: .identity)
            pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.minY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius, transform: .identity)
            pathRef.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY), transform: .identity)
        } else if indexPath.row == (numberOfRows(inSection: indexPath.section) - 1) {
            pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.minY), transform: .identity)
            pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.midX, y: bounds.maxY), radius: cornerRadius, transform: .identity)
            pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius, transform: .identity)
            pathRef.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY), transform: .identity)
        } else {
            pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.minY), transform: .identity)
            pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.midX, y: bounds.maxY), radius: 0, transform: .identity)
            pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: 0, transform: .identity)
            pathRef.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY), transform: .identity)
        }
        // 把已经绘制好的可变图像路径赋值给图层，然后图层根据这图像path进行图像渲染render
        layer.path = pathRef
        // 颜色修改
        layer.fillColor = UIColor.white.cgColor
        layer.strokeColor = UIColor.white.cgColor
        let testView = UIView(frame: bounds)
        testView.layer.insertSublayer(layer, at: 0)
        testView.backgroundColor = UIColor.clear
        cell.backgroundView = testView
    }
}
