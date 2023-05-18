//
//  CreateTableViewController.swift
//  RSwiftBase
//
//  Created by 林小鹏 on 2023/2/19.
//

import UIKit

class CreateTableViewController: UIViewController {
    lazy var tableV: UITableView = {
        let table = UITableView()

        //    table.register(UINib(nibName: "SZStoresLogisticsMsgTopCell", bundle: nil), forCellReuseIdentifier: SZStoresLogisticsMsgTopCell.rIdentifier)
        
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        /// 上下滑动指示器
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.addSubview(tableV)
//        tableV.snp.makeConstraints { make in
//            make.edges.equalTo(self.view)
//        }

    }
}

extension CreateTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let baseV = UIView()
        baseV.backgroundColor = rColor.hex(hexValue: 0xF8F9FB)
        return baseV
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: SZStoresLogisticsButtonsCell.rIdentifier) as! SZStoresLogisticsButtonsCell
//        return cell
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
