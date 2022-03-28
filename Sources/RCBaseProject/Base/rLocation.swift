//
//  LocationConfig.swift
//  TheWay
//
//  Created by 林小鹏 on 2021/12/24.
//  判断是否开启定位

import Foundation
import CoreLocation

struct rLocation {
    /**
     跳转定位设置
     */
    static func jumpLocationSetting() {
        let alert = UIAlertController(title: "定位服务已关闭", message: "我们需要通过您的地理位置信息获取您周边的信息,您需要打开定位服务,才可以为您服务", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "暂不开启", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "去设置", style: .destructive, handler: { _ in
            let settingUrl = URL(string: UIApplication.openSettingsURLString)!
            if UIApplication.shared.canOpenURL(settingUrl) {
                UIApplication.shared.open(settingUrl, options: [:], completionHandler: nil)
            }
        }))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }

    /**
     是否开启定位
     */
    static func isEnableLocationPermissions() -> Bool {
        if ((CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways) || (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.notDetermined)) && CLLocationManager.locationServicesEnabled() {
            return true
        } else if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.denied {
            jumpLocationSetting()
            return false
        }
        return true
    }
}
