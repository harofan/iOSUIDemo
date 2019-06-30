//
//  WaterFallViewController.swift
//  iOSUIDemo
//
//  Created by Link on 2019/6/29.
//  Copyright © 2019 Link. All rights reserved.
//

import UIKit

class WaterFallViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let waterFallLayout = WaterFallFlowLayout()
        waterFallLayout.delegate = self
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: waterFallLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WaterFallCollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        return collectionView
    }()
    
    private lazy var dataArray: [Int] = [300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460, 300, 200, 100, 200, 500, 500, 300, 250, 280, 40, 580, 200, 460]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "瀑布流"
        
        initView()
    }

    func initView() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
extension WaterFallViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath) as! WaterFallCollectionViewCell
        cell.titleLabel.text = "\(indexPath.row)"
        
        return cell
    }
}
extension WaterFallViewController: UICollectionViewDelegate, WaterFallFlowLayoutProtocol {
    func getItemHeight(waterFallFlowLayout: WaterFallFlowLayout, indexPath: IndexPath) -> CGFloat {
        let cellHeight = dataArray[indexPath.row]
        return CGFloat(cellHeight)
    }
    
    
}
