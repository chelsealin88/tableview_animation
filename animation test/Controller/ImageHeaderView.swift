//
//  ImageHeaderView.swift
//  animation test
//
//  Created by Chelsea Lin on 2019/9/10.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class ImageHeaderView: UICollectionReusableView {
    
    let imageView : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "image-14"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
