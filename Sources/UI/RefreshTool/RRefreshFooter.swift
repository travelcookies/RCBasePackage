//
//  ParkingRefreshFooter.swift
//  SZParking
//
//  Created by nbfujx on 2020/9/15.
//  Copyright © 2020 ningbokubin. All rights reserved.
//  GTMRefresh 自定义

import GTMRefresh
import UIKit

class RRefreshFooter: GTMLoadMoreFooter, SubGTMLoadMoreFooterProtocol {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        return imageView
    }()

    lazy var tipLab: UILabel = {
        let tipLab = UILabel()
        tipLab.textAlignment = .center
        tipLab.text = "没有更多啦!!!"
        tipLab.textColor = rColor.RGB(r: 29, g: 29, b: 35)
        tipLab.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        tipLab.isHidden = true
        return tipLab
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.center = CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)

        tipLab.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }

    func toNormalState() {
        imageView.isHidden = false
        tipLab.isHidden = true
        imageView.stopAnimating()
    }

    func toRefreshingState() {
    }

    func toWillRefreshState() {
        let images = ["driving-loading-1", "driving-loading-2", "driving-loading-3", "driving-loading-4", "driving-loading-5", "driving-loading-6", "driving-loading-7", "driving-loading-8"].map { (name) -> UIImage in
            UIImage(named: name)!
        }
        imageView.animationImages = images
        imageView.animationDuration = Double(images.count) * 0.15
        imageView.startAnimating()
    }

    func toNoMoreDataState() {
        imageView.animationImages = nil
        imageView.stopAnimating()
        imageView.isHidden = true
        tipLab.isHidden = false
    }

    func contentHeith() -> CGFloat {
        return 44
    }
}
