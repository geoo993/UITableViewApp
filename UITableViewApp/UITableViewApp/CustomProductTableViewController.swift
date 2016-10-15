//
//  NewTableViewController.swift
//  UITableViewApp
//
//  Created by GEORGE QUENTIN on 15/10/2016.
//  Copyright © 2016 GEORGE QUENTIN. All rights reserved.
//

import Foundation
import UIKit


class CustomProductTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var media = String()
    var mediaTypeTitle = String()
    var getProducts = [Product]()
    
    var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = UIColor.randomColor()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.title = media
        //self.tableView.rowHeight = UITableViewAutomaticDimension 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        self.tableView = tableView
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        self.tableView = tableView
        return getProducts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        self.tableView = tableView
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Product Cell", forIndexPath: indexPath) as? MediaTableViewCell
         //let cell = tableView.dequeueReusableCellWithIdentifier("NewCell") as? aCell 
        else 
        { print("No Cell found"); return UITableViewCell()}
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.selectionStyle = UITableViewCellSelectionStyle.Blue
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        
        let product = getProducts[indexPath.row]
        cell.titleLabel.text = product.title
        
        cell.descriptionLabel.text = product.description
        cell.descriptionLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        
        let img = product.image.imageWithSize(CGSize(width: 50,height: 100), extraMargin: 0)
        cell.imgView.image = img
        
        
        return cell
    }
   
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat 
    {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Product Cell")
            else 
        { print("No Cell found"); return CGFloat()}
        
        
        let size: CGSize = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        
        let height = size.height
        return height //200.0;//Choose your custom row height
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

    
    //performSegueWithIdentifier(identifier: "", sender: AnyObject?)
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if let identifier = segue.identifier {
            
            switch identifier {
                case "Show Detail":
                    
                    guard 
                    let cell = sender as? UITableViewCell,
                    let indexPath : NSIndexPath = self.tableView.indexPathForCell(cell),
                        //let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow,
                    let destinationViewController = segue.destinationViewController as? CustomMediaDetailedViewController else { print("Cant Page View Controller or index path is wrong"); return }
                    
                    mediaAtInexPath(destinationViewController, indexPath: indexPath)
                    
                
            default:
                print("No Identifier")
                break
            }
            
        }
        
    }
    
    
   // Mark: - Helper method
    func mediaAtInexPath(destinationViewController: CustomMediaDetailedViewController, indexPath : NSIndexPath ){
        
        destinationViewController.heading = mediaTypeTitle
        //destinationViewController.titleText = getProducts[self.indexPath.row].title
        destinationViewController.image = getProducts[indexPath.row].image
        destinationViewController.descriptionText = getProducts[indexPath.row].description
    }
    

}
