//
//  CardLayout.swift
//  animation test
//
//  Created by Chelsea Lin on 2019/9/5.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation
import UIKit

class CardLayout : UICollectionViewFlowLayout {
    
    
    private var collectionViewHight: CGFloat {
        return collectionView!.frame.height
    }
    
    private var collectionViewWidth: CGFloat {
        return collectionView!.frame.width
    }
    
    private var cellWidth: CGFloat {
        return collectionViewWidth *  0.7
    }
    
    private var cellMargin: CGFloat {
        return (collectionViewWidth - cellWidth) / 7
    }
    // 内邊距
    private var margin: CGFloat {
        return (collectionViewWidth - cellWidth) / 2
    }
    
    override func prepare() {
        super.prepare()
        scrollDirection = .horizontal
        sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        minimumLineSpacing = cellMargin
        itemSize = CGSize(width: cellWidth, height: collectionViewHight * 0.75)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard let collectionView = self.collectionView else { return nil }
        guard let visibleAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
        let centerX = collectionView.contentOffset.x + collectionView.bounds.size.width/2
        for attribute in visibleAttributes {
            
            // 獲取cell中心距離 屏幕中心位置的絕對值。
            let distance = abs(attribute.center.x - centerX)
            // 用上一步獲取的值，除以屏幕寬得到一个縮放比例
            let aprtScale = distance / collectionView.bounds.size.width
            // 將卡片的缩放範圍規定到 -π/4 到 +π/4之間
            let scale = abs(cos(aprtScale * CGFloat(Double.pi/4)))
            // 設置cell的縮放 按照余弦函数曲线 越居中越趋近于1
            attribute.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        return visibleAttributes
    }
    
    // 是否实时刷新布局
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
