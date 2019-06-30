//
//  WaterFallCollectionViewCell.swift
//  iOSUIDemo
//
//  Created by Link on 2019/6/30.
//  Copyright © 2019 Link. All rights reserved.
//

import UIKit

class WaterFallCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    public lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
