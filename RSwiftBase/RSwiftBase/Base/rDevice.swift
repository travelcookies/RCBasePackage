//
//  ConstantFile.swift
//  SZParking
//
//  Created by nbfujx on 2020/7/28.
//  Copyright © 2020 ningbokubin. All rights reserved.
//
//  获取手机型号,不变得基础信息
import Foundation
import UIKit

public struct rDevice {
    public static let share = rDevice()

    /// 手机型号
    public let name: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        switch identifier {
        case "iPod5,1": return "iPod Touch 5"
        case "iPod7,1": return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3": return "iPhone 4"
        case "iPhone4,1": return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2": return "iPhone 5"
        case "iPhone5,3", "iPhone5,4": return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2": return "iPhone 5s"
        case "iPhone7,2": return "iPhone 6"
        case "iPhone7,1": return "iPhone 6 Plus"
        case "iPhone8,1": return "iPhone 6s"
        case "iPhone8,2": return "iPhone 6s Plus"
        case "iPhone9,1": return "iPhone 7"
        case "iPhone9,2": return "iPhone 7 Plus"
        case "iPhone10,1", "iPhone10,4": return "iPhone 8"
        case "iPhone10,2", "iPhone10,5": return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6": return "iPhone X"
        case "iPhone11,2": return "iPhone XS"
        case "iPhone11,6": return "iPhone XS MAX"
        case "iPhone11,8": return "iPhone XR"
        case "iPhone12,1": return "iPhone 11"
        case "iPhone12,3": return "iPhone 11 Pro"
        case "iPhone12,5": return "iPhone 11 Pro MAX"
        case "iPhone13,1": return "iPhone 12 mini"
        case "iPhone13,2": return "iPhone 12"
        case "iPhone13,3": return "iPhone 12 Pro"
        case "iPhone13,4": return "iPhone 12 Pro MAX"
        case "iPhone14,4": return "iPhone 13 mini"
        case "iPhone14,5": return "iPhone 13"
        case "iPhone14,2": return "iPhone 13 Pro"
        case "iPhone14,3": return "iPhone 13 Pro Max"
        case "iPhone14,6": return "iPhone SE (3rd generation)"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3": return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6": return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3": return "iPad Air"
        case "iPad5,3", "iPad5,4": return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7": return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6": return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9": return "iPad Mini 3"
        case "iPad5,1", "iPad5,2": return "iPad Mini 4"
        case "iPad6,7", "iPad6,8": return "iPad Pro"
        case "iPad6,3", "iPad6,4": return "iPad Pro (9.7-inch)"
        case "iPad7,1", "iPad7,2": return "iPad Pro (12.9-inch) (2nd generation)"
        case "iPad7,4", "iPad7,3": return "iPad Pro (10.5-inch)"
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": return "iPad Pro (11-inch)"
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8": return "iPad Pro (12.9-inch) (3rd generation)"
        case "iPad8,9", "iPad8,10": return "iPad Pro (11-inch) (2nd generation)"
        case "iPad8,11", "iPad8,12": return "iPad Pro (12.9-inch) (4th generation)"
        case "iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7": return "iPad Pro (11-inch) (3rd generation)"
        case "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11": return "iPad Pro (12.9-inch) (5th generation)"
        case "AppleTV5,3": return "Apple TV"
        case "i386", "x86_64": return "Simulator"
        default: return identifier
        }

    }()

    /// 获取设备名称 例如：梓辰的手机
    public let deviceName = UIDevice.current.name
    /// 获取系统名称 例如：iPhone OS
    public let sysName = UIDevice.current.systemName
    /// 获取系统版本 例如：9.2
    public let sysVersion = UIDevice.current.systemVersion
    /// 获取设备唯一标识符 例如：FBF2306E-A0D8-4F4B-BDED-9333B627D3E6
    public let deviceUUID = UIDevice.current.identifierForVendor?.uuidString
    /// 获取设备的型号 例如：iPhone
    public let deviceModel = UIDevice.current.model

    public var infoDic = Bundle.main.infoDictionary
    /// 获取App的版本
//    let appVersion = rDevice.share.infoDic?["CFBundleShortVersionString"] ?? ""
    ////    self.infoDic?["CFBundleShortVersionString"]
//    /// 获取App的build版本
//    let appBuildVersion = rDevice.share.infoDic?["CFBundleVersion"] ?? ""
//    /// 获取App的名称
//    let appName = rDevice.share.infoDic?["CFBundleDisplayName"] ?? ""
}
