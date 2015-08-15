//
//  SecondViewController.swift
//  FoodAnalyzer
//
//  Created by ranhui on 15/8/14.
//  Copyright (c) 2015年 ranhui.test. All rights reserved.
//

import UIKit

class MyViewController: UITableViewController {
    var listMyCells: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var bundle = NSBundle.mainBundle()
        let plistPath:String! = bundle.pathForResource("MyCells", ofType: "plist")
        
        listMyCells = NSMutableArray(contentsOfFile: plistPath)
        
      
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //返回某个节中的行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return listMyCells.count
       
        
    }

    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
  
            return 5
     
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {5
            return 40
  
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
            var headerView = UIView(frame: CGRectMake(0, 0, 100, 5))
            headerView.backgroundColor = UIColor(red: 239, green: 239, blue: 244, alpha: 1)
            
            return headerView
       

    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  
            let cellIdentifier : String = "MyCellIdentifier"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell
            
            var row = indexPath.row
            var rowDict:NSDictionary = listMyCells.objectAtIndex(row) as! NSDictionary
            
            cell.textLabel?.text = rowDict.objectForKey("title") as? String
            var imgSrc = rowDict.objectForKey("image") as? String

            cell.imageView?.image = UIImage(named: imgSrc!)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
          
            
            return cell
            
            
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }


}

