//
//  CardCollectionViewController.swift
//  animation test
//
//  Created by Chelsea Lin on 2019/9/5.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit


class CardCollectionViewController: UICollectionViewController {
    
    var colors : [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colors = DataManager.shared.generalColors(15)
        
    }

   

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return colors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicsCollectionViewCell.reuseID, for: indexPath) as! BasicsCollectionViewCell
        let color = colors[indexPath.row]
        cell.backgroundColor = color
        // Configure the cell
    
        return cell
    }
    

}

