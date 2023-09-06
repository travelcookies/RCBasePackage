//
//  JsonManager.swift
//  WildernessStroe
//
//  Created by 林小鹏 on 2022/7/28.
//
//
/**
 /// name : 本地json名字; Model:需要转换的模型
 JsonManager.share.request(name: "WSPintuanScenicSpot", model: [WSMainWholesaleScenicSpotModel].self) { returnData in
     guard let data = returnData else {
         return
     }
     self.dataArray = data
     self.tableView.reloadData()
 }
 */

import Foundation
import HandyJSON

class JsonManager {
    static let share = JsonManager()

    func getJsonData(_ name: String) -> [String: Any]? {
        let path = Bundle.main.path(forResource: name, ofType: "json")
        let url = URL(fileURLWithPath: path!)
        // 带throws的方法需要抛异常
        do {
            /*
             * try 和 try! 的区别
             * try 发生异常会跳到catch代码中
             * try! 发生异常程序会直接crash
             */
            let data = try Data(contentsOf: url)
            let jsonData: [String: Any]? = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any]

            return jsonData

        } catch let error as Error? {
            print("读取本地数据出现错误!", error as Any)
            return nil
        }
    }

    open func request<T>(name: String,
                         model: T.Type,
                         completion: ((_ returnData: T?) -> Void)?) {
        let jsonDic = getJsonData(name)
        guard let jsonData = JSONDeserializer<BaseModel<T>>.deserializeFrom(dict: jsonDic) else {
            completion!(nil)
            return
        }

        completion!(jsonData.data)
    }
}
