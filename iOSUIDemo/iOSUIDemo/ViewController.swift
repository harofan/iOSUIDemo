//
//  ViewController.swift
//  iOSUIDemo
//
//  Created by Link on 2019/6/29.
//  Copyright © 2019 Link. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var tableview: UITableView = {
       let tableview = UITableView()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tableview
    }()
    
    private lazy var dataArray: [String] = {
       return ["瀑布流"]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            // 瀑布流
            self.navigationController?.pushViewController(WaterFallViewController(),
                                                          animated: true)
        default:
            break
        }
    }
}
