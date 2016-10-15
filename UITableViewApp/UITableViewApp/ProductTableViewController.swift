//
//  ProductTableViewController.swift
//  UITableViewApp
//
//  Created by GEORGE QUENTIN on 13/10/2016.
//  Copyright © 2016 GEORGE QUENTIN. All rights reserved.
//

import UIKit
import Foundation

class ProductTableViewController: UITableViewController {

   
    
    var media = String()
    var mediaTypeTitle = String()
    var getProducts = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.title = media
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return getProducts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Products Cell", forIndexPath: indexPath)
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.selectionStyle = UITableViewCellSelectionStyle.Blue
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        // Configure the cell...
        
        // populate the data in your cell as desired
        //cell2.menuListLabel.text = "some text"
        //cell2.menuListImage.image = UIImage(named: "some image")

        
        
        let product = getProducts[indexPath.row]
        
        //cell.frame = CGRectMake(0,0,320,400);
        //var cellRect = tableView.rectForRowAtIndexPath(indexPath)
        //cellRect = CGRectMake(cellRect.origin.x - tableView.contentOffset.x, cellRect.origin.y - tableView.contentOffset.y, cellRect.size.width, cellRect.size.height);
        
       
        cell.textLabel?.text = product.title
        
        let constrainedSize = CGSizeMake(cell.detailTextLabel!.frame.size.width, 200)
        var cframe = cell.detailTextLabel!.frame;
        cframe.size.height = constrainedSize.height;
        cell.detailTextLabel?.frame = cframe;
        cell.detailTextLabel?.numberOfLines = 0;
        cell.detailTextLabel?.text = product.description
        
        let img = product.image.imageWithSize(CGSize(width: 50,height: 100), extraMargin: 0)
        cell.imageView?.image = img
        
    
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat 
    {
        return 200.0;//Choose your custom row height
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard 
            let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow,
            let destinationViewController = segue.destinationViewController as? PageViewController else { print("Cant Find Page View Controller or index path is wrong"); return }
        
        
        destinationViewController.heading = mediaTypeTitle
        destinationViewController.titleText = getProducts[indexPath.row].title
        destinationViewController.image = getProducts[indexPath.row].image
        destinationViewController.descriptionText = getProducts[indexPath.row].description
       
    }
    

}
