////
////  ParkingRefreshHeader.swift
////  SZParking
////
////  Created by nbfujx on 2020/7/31.
////  Copyright © 2020 ningbokubin. All rights reserved.
////  GTMRefresh 自定义
//
//
////import GTMRefresh
//import UIKit
//
//class RRefreshHeader: GTMRefreshHeader, SubGTMRefreshHeaderProtocol {
//    lazy var imageView: UIImageView = {
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
//        return imageView
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.addSubview(imageView)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        imageView.center = CGPoint(x: rScreen.width / 2.0, y: 35)
//    }
//
//    func toNormalState() {}
//    func toRefreshingState() {
//        var images = [UIImage]()
//        for i in 1 ... 81 {
//            let img = UIImage(named: "driving-animation-\(i)")
//            images.append(img ?? UIImage(named: "driving-animation-\(1)")!)
//        }
//        imageView.animationImages = images
//        imageView.animationDuration = Double(images.count) * 0.015
//        imageView.startAnimating()
//    }
//
//    func toPullingState() {}
//    func toWillRefreshState() {}
//    func changePullingPercent(percent: CGFloat) {
//        imageView.isHidden = (percent == 0)
//        let adjustPercent = max(min(1.0, percent), 0.0)
//        let mappedIndex = Int(adjustPercent * 21)
//        print("pull percent index = \(mappedIndex), adp = \(adjustPercent)")
//        let imageName = "driving-animation-\(mappedIndex + 20)"
//        let image = UIImage(named: imageName)
//        imageView.image = image
//    }
//
//    func willEndRefreshing(isSuccess: Bool) {}
//    func didEndRefreshing() {
//        imageView.animationImages = nil
//        imageView.stopAnimating()
//        imageView.isHidden = true
//    }
//
//    func contentHeight() -> CGFloat {
//        return 70
//    }
//}
