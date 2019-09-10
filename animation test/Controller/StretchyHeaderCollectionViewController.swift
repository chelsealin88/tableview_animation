//
//  StretchyHeaderCollectionViewController.swift
//  animation test
//
//  Created by Chelsea Lin on 2019/9/10.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit


class StretchyHeaderCollectionViewController: UICollectionViewController {
    
    fileprivate let cellid = "cell"
    fileprivate let headerId = "headerId"
    fileprivate let padding : CGFloat = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionViewLayout()
        setupCollectionView()

    }
    
    fileprivate func setupCollectionViewLayout() {
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    
    fileprivate func setupCollectionView() {
        
        collectionView.register(ImageHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.contentInsetAdjustmentBehavior = .never
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellid)
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
        cell.backgroundColor = .black
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
}

extension StretchyHeaderCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        return CGSize(width: width - 2 * padding, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: 350)
    }
}
