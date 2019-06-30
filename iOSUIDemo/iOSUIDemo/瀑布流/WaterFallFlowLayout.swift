//
//  WaterFallFlowLayout.swift
//  iOSUIDemo
//
//  Created by Link on 2019/6/29.
//  Copyright © 2019 Link. All rights reserved.
//

import UIKit

protocol WaterFallFlowLayoutProtocol: class {
    func getItemHeight(waterFallFlowLayout: WaterFallFlowLayout, indexPath: IndexPath) -> CGFloat
}

class WaterFallFlowLayout: UICollectionViewFlowLayout {
    
    weak var delegate: WaterFallFlowLayoutProtocol?
    
    // 所有列高度集合
    var columnHeightArray: [CGFloat] = []
    // 所有item布局属性
    var columnLayoutAttrArray: [UICollectionViewLayoutAttributes] = []
    // 当前高度
    var contentHeight: CGFloat = 0
    
    // 列数
    let columCount = 3
    // 列间距
    let columMargin = CGFloat(10)
    // 行间距
    let rowMargin = CGFloat(20)
    // 内边距
    let edgeInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    override init() {
        super.init()
        scrollDirection = .vertical
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        // 重置高度
        contentHeight = 0
        
        // 清除计算的高度
        columnHeightArray.removeAll()
        
        // 将每一列的高度置为inset
        for _ in 0..<columCount {
            columnHeightArray.append(edgeInset.top)
        }
        
        // 清除之前所有的布局属性
        columnLayoutAttrArray.removeAll()
        
        // 创建每一个cell对应的布局属性
        let itemCount = collectionView?.numberOfItems(inSection: 0) ?? 0
        for i in 0..<itemCount {
            // 创建位置
            let indexPath = IndexPath(item: i, section: 0)
            
            // 获取item对应布局属性
            let layoutAttr = getItemLayoutAttr(indexPath: indexPath)
            
            columnLayoutAttrArray.append(layoutAttr)
        }
        
    }
    
    // 返回该indexpath下item对应的布局属性
    private func getItemLayoutAttr(indexPath: IndexPath) -> UICollectionViewLayoutAttributes {
        
        // 创建布局属性
        let layoutAttr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        // 获取collectionview宽度
        let collectionViewWidth = collectionView?.frame.size.width ?? 0
        
        // 设置布局属性的frame
        let marginW = CGFloat((columCount - 1)) * columMargin
        let cellW = (collectionViewWidth - edgeInset.left - edgeInset.right - marginW) / CGFloat(columCount)
        let cellH = self.delegate?.getItemHeight(waterFallFlowLayout: self, indexPath: indexPath) ?? 0
        
        // 找出最短的一列
        var minColumn = 0
        var minColumnHeight = self.columnHeightArray.first ?? 0
        
        for i in 0..<columCount {
            
            let currentColumnHeight = self.columnHeightArray[i]
            if minColumnHeight > currentColumnHeight {
                minColumn = i
                minColumnHeight = currentColumnHeight
            }
        }
        
        // 设置item的x和y
        let cellX = edgeInset.left + CGFloat(minColumn) * (cellW + columMargin)
        var cellY = minColumnHeight
        
        // 如果不是第一排则需要加一行空隙
        if cellY != edgeInset.top {
            cellY += rowMargin
        }
        
        layoutAttr.frame = CGRect(x: cellX, y: cellY, width: cellW, height: cellH)
        
        // 更新当前列的高度
        columnHeightArray[minColumn] = layoutAttr.frame.maxY
        
        if contentHeight < layoutAttr.frame.maxY {
            contentHeight = layoutAttr.frame.maxY
        }
        
        return layoutAttr
    }
    
    // 决定item的布局
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return columnLayoutAttrArray
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 0, height: contentHeight + edgeInset.bottom)
    }
}
