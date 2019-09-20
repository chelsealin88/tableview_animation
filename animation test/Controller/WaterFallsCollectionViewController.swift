//
//  WaterFallsCollectionViewController.swift
//  animation test
//
//  Created by Chelsea Lin on 2019/9/10.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit


class WaterFallsCollectionViewController: UICollectionViewController {
    
    var colors : [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colors = DataManager.shared.generalColors(35)
        setupCollectionViewLayout()

    }

    fileprivate func setupCollectionViewLayout() {
        
        if let layout = collectionView?.collectionViewLayout as? WaterFallsLayout {
            layout.delegate = self
        }
    }
   
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return colors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicsCollectionViewCell.reuseID, for: indexPath) as! BasicsCollectionViewCell
        cell.backgroundColor = colors[indexPath.row]
        
        return cell
    }

}

extension WaterFallsCollectionViewController : UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}


extension WaterFallsCollectionViewController : WaterFallsLayoutDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, heightForItemAt indexPath: IndexPath) -> CGFloat {
        let random = arc4random_uniform(4) + 2
        return CGFloat(random * 50)
    }

}
