//
//  TableViewController.swift
//  animation test
//
//  Created by Chelsea Lin on 2019/9/3.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var myarray = ["Collection View基礎佈局", "卡片佈局", "伸縮Header", "瀑布流", "標籤效果"]
    
    enum Section: Int {
        case basics = 0
        case card
        case expandHeader
        case waterFall
        case mark
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        animateTable()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myarray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myarray[indexPath.row]

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case Section.basics.rawValue:
            let vc = storyboard?.instantiateViewController(withIdentifier: "BasicsCollectionViewController") as! BasicsCollectionViewController
            navigationController?.pushViewController(vc, animated: true)
        case Section.card.rawValue:
            let vc = storyboard?.instantiateViewController(withIdentifier: "CardCollectionViewController") as! CardCollectionViewController
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
  
    func animateTable() {
        
        tableView.reloadData()
        
        let cells = self.tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
          
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .init() , animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            
            index += 1
        }
    }
    

}
