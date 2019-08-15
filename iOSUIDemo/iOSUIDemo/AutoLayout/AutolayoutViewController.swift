//
//  AutolayoutViewController.swift
//  iOSUIDemo
//
//  Created by Link on 2019/8/15.
//  Copyright © 2019 Link. All rights reserved.
//

import UIKit

class AutolayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "autolayout"
        view.backgroundColor = .white
        testPriority()
    }

    func testPriority() {
        
        let label1 = UILabel()
        label1.backgroundColor = .red
        label1.text = "不想被拉伸"
        // 抗拉伸等级越高, 越不容易拉伸, 默认250
        label1.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
        // 抗压缩等级, 默认750
//        label1.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
        
        let label2 = UILabel()
        label2.backgroundColor = .orange
        label2.text = "jkmslfjdsklfjdskljf"
        label2.setContentHuggingPriority(UILayoutPriority(rawValue: 900), for: .horizontal)
        
        view.addSubview(label1)
        view.addSubview(label2)
        
        label1.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalTo(label2.snp.left)//.priority(750)
            make.top.equalToSuperview().offset(80)
            make.height.equalTo(48)
        }
        
        label2.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.top.height.equalTo(label1)
            make.left.equalTo(label1.snp.right)
        }
        
    }
}
