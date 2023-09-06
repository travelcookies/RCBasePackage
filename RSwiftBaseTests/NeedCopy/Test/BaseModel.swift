//
//  BaseModel.swift
//  SZParking
//
//  Created by nbfujx on 2020/8/10.
//  Copyright © 2020 ningbokubin. All rights reserved.
//

import UIKit
import HandyJSON

class BaseModel<T>: NSObject,HandyJSON {
    var code:String?
    var msg:String?
    var data:T?
    required override init(){}
}

class CodeMsgModel: NSObject,HandyJSON{
    var code: Int = -1
    var msg: String?
    required override init(){}
}


