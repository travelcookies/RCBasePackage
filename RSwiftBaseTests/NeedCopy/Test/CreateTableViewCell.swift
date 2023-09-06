//
//  CreateTableViewCell.swift
//  RSwiftBase
//
//  Created by 林小鹏 on 2023/2/19.
//  悬浮效果的  <订单详情等> suspend

import UIKit

class BaseSuspendTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    enum BaseSuspendTableViewBaseStyle {
        case top
        case bottom
        case all
        case none
    }

    // 基础悬浮上或者下需要圆角
    // CGRect(x: 0, y: 5, width: rScreen.width - 32, height: 46)
    func addCorner(with baseV: UIView, rect: CGRect, type: BaseSuspendTableViewBaseStyle, radius: CGFloat = 8.0) {
        switch type {
        case .top:
            baseV.xp.addCorner(conrners: [.topLeft, .topRight], radius: radius, rect)
            break
        case .bottom:
            baseV.xp.addCorner(conrners: [.bottomLeft, .bottomRight], radius: radius, rect)
            break
        case .all:
            baseV.layer.cornerRadius = radius
            break
        case .none:
            break
        }
    }
}
