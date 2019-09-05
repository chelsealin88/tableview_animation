//
//  BasicsCollectionViewController.swift
//  animation test
//
//  Created by Chelsea Lin on 2019/9/4.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit


class BasicsCollectionViewController: UICollectionViewController {
    
    var colors : [[UIColor]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(_:)))
        collectionView.addGestureRecognizer(longGesture)
        
        colors.append(DataManager.shared.generalColors(5))
        colors.append(DataManager.shared.generalColors(7))
        colors.append(DataManager.shared.generalColors(9))
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = true
        }
        
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return colors.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return colors[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicsCollectionViewCell.reuseID, for: indexPath)  as! BasicsCollectionViewCell
        cell.backgroundColor = colors[indexPath.section][indexPath.row]
        
        // Configure the cell
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! BasicsHeaderView
            view.headerLabel.text = "HEADER -- \(indexPath.section)"
            return view
        case UICollectionView.elementKindSectionFooter:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterView", for: indexPath) as! BasicsFooterView
            view.footerLabel.text = "FOOTER -- \(indexPath.section)"
            return view
        default:
            fatalError("No such kind")
        }
        
        
    }
    
    @objc func longPressed(_ gesture: UILongPressGestureRecognizer) {
        let position = gesture.location(in: collectionView)
        switch gesture.state {
        case .began:
            if let indexPath = collectionView.indexPathForItem(at: position) {
                collectionView.beginInteractiveMovementForItem(at: indexPath)
            }
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(position)
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
        
    }
}

extension BasicsCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    // 设置itemsize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch (indexPath.section) {
        case 0:
            let cellSize = (view.bounds.width - 4) / 3
            return CGSize(width: cellSize, height: cellSize)
        case 1:
            return CGSize(width: view.bounds.width, height: 50)
        default:
            let cellSize = (view.bounds.width - 15) / 2
            return CGSize(width: cellSize, height: cellSize)
        }
       
    }
    // 设置sectionInset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch (section) {
        case 0:
            return UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        case 1:
            return .zero
        default:
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
        
    }
    // 设置 minimumLineSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        switch (section) {
        case 0:
            return 1
        case 1:
            return 2
        default:
            return 5
        }
    }
    // 设置 minimumInteritemSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return 2
        } else {
            return 5
        }
    }
    
    
    // 设置header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.bounds.width

        switch (section) {
        case 0:
            return CGSize(width: width, height: 50)
        case 1:
            return CGSize(width: width, height: 50)
        default:
            return CGSize(width: width, height: 50)
        }
    
    }
    // 设置footer size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let width = view.bounds.width
        return CGSize(width: width, height: 20)
    }
    
    // cell 點擊改變Scaled
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.transform = CGAffineTransform.identity.scaledBy(x: 0.8, y: 0.8)
                cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.transform = .identity
                cell.contentView.backgroundColor = .clear
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // 修改item位置
        let removedColor = self.colors[sourceIndexPath.section][sourceIndexPath.row]
        self.colors[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        self.colors[destinationIndexPath.section].insert(removedColor, at: destinationIndexPath.row)
    }
}

extension UIColor {
    
    static func randomColor() -> UIColor{
        let red = CGFloat(arc4random_uniform(255) + 1)
        let green = CGFloat(arc4random_uniform(255) + 1)
        let blue = CGFloat(arc4random_uniform(255) + 1)
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

class DataManager {
    
    static let shared = DataManager()
    
    func generalColors(_ count: Int) -> [UIColor] {
        
        var colors = [UIColor]()
        
        for _ in 0..<count{
            colors.append(UIColor.randomColor())
        }
        return colors
    }
}
