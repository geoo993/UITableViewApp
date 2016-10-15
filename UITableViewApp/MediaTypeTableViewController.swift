//
//  MediaTypeTableViewController.swift
//  UITableViewApp
//
//  Created by GEORGE QUENTIN on 13/10/2016.
//  Copyright © 2016 GEORGE QUENTIN. All rights reserved.
//

import Foundation
import UIKit




class MediaTypeTableViewController: UITableViewController {

    
    var productLines = ProductLine.productLines()
    lazy var mediaTypes : [MediaType] = {
        return MediaType.AllMedias() 
    }()
    
    var mediaTypesTitle : [String] = ["Movie", "Video Game", "TV Serie", "Music", "Book", "Countries"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Media"
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Media Type Cell")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editing(sender: UIBarButtonItem) {
        
        if self.tableView.editing == true{
            
            self.tableView.setEditing(false, animated: true)
            self.editButtonItem().style = UIBarButtonItemStyle.Plain
            self.editButtonItem().title = "Edit"
        }else{
            self.tableView.setEditing(true, animated: true)
            self.editButtonItem().style = UIBarButtonItemStyle.Done
            self.editButtonItem().title = "Done"
        }
       
    }
    
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.None
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    

    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let product = mediaTypes[sourceIndexPath.row]
        mediaTypes.removeAtIndex(sourceIndexPath.row)
        mediaTypes.insert(product, atIndex: destinationIndexPath.row)
        
        let p = productLines[sourceIndexPath.row]
        productLines.removeAtIndex(sourceIndexPath.row)
        productLines.insert(p, atIndex: destinationIndexPath.row)
        
        self.tableView.reloadData()
    }
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mediaTypes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
   
        let cell = tableView.dequeueReusableCellWithIdentifier("Media Type Cell", forIndexPath: indexPath)
        //let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Media Type")
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.selectionStyle = UITableViewCellSelectionStyle.Blue
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        //cell.accessoryView = UIView(frame: CGRectMake(0, 0, 20, 20))
        //cell.accessoryView!.backgroundColor = UIColor.blueColor()
        
        let media = mediaTypes[indexPath.row]
        
        let img = media.image.imageWithSize(CGSize(width: 80,height: 80), extraMargin: 0)
        
        cell.textLabel?.text = media.title
        cell.detailTextLabel?.text = media.description
        cell.imageView?.image = img        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat 
    {
        return 100.0;//Choose your custom row height
    }
    

    
    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard 
        let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow,
        let destinationViewController = segue.destinationViewController as? 
            //ProductTableViewController 
            CustomProductTableViewController
            else { print("Cant Find Product Table View Controller or index path is wrong"); return }
        
        
//        var products : [Product] {
//            var productLines = ProductLine.productLines()
//            return productLines[indexPath.row].products
//        }
        
        destinationViewController.mediaTypeTitle = mediaTypesTitle[indexPath.row]
        destinationViewController.media = mediaTypes[indexPath.row].title
        destinationViewController.getProducts = productLines[indexPath.row].products
        destinationViewController.productShown = [Bool](count: productLines[indexPath.row].products.count, repeatedValue: false)
        
        
    }
    
    func chosingMedia (mediaChosen: String) -> Int {
        
        switch mediaChosen {
        case "Movies":
            return 0
        case "TV Series":
            return 1
        case "Video Games":
            return 2
        case "Music":
            return 3
        case "Books":
            return 4
        default:
            return 0
        }
        
    }
    
    func chosingMediaWithIndexPath (index: Int) -> String {
        
        switch index {
        case 0:
            return "Movies"
        case 1:
            return "TV Series"
        case 2:
            return "Video Games"
        case 3:
            return "Music"
        case 4:
            return "Books"
        default:
            return ""
        }
        
    }

}
