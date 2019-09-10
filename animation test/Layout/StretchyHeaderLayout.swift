//
//  StretchyHeaderLayout.swift
//  animation test
//
//  Created by Chelsea Lin on 2019/9/10.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                
                guard let collectionView = collectionView else { return }
                let contentOffSetY = collectionView.contentOffset.y
                print(contentOffSetY)
                
                let width = collectionView.frame.width
            
                //header
                attributes.frame = CGRect(x: 0, y: 0, width: width, height: attributes.frame.height)
            }
        })
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}
