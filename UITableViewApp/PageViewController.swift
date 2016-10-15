//
//  PageViewController.swift
//  UITableViewApp
//
//  Created by GEORGE QUENTIN on 12/10/2016.
//  Copyright © 2016 GEORGE QUENTIN. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {

    
    var heading = String()
    
    let titleLabel = UILabel()
    var titleText = "Hello"
    
    let imageView = UIImageView()
    var image = UIImage()
    
    let descriptionLabel = UITextView()
    var descriptionText = "hdshjsdhjggjasdghjdsaghjhjgdsa"
    
    let textColor = UIColor.blackColor()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = heading
        
        self.view.backgroundColor = UIColor.randomColor()
        
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        
        let width = viewWidth/1.2
        let width2 = viewWidth/1.4
        let xPos = viewWidth/12
        let xPos2 = viewWidth/7
        
        
        let yPos1 = viewHeight/8.5
        let yPos2 = viewHeight/4.7
        let yPos3 = viewHeight/1.73
        
        
        let height1 = viewHeight/12
        let height2 = viewHeight/2.8
        let height3 = viewHeight/2.5
        
        
        let titleFrame = CGRect(x: xPos, y: yPos1, width: width, height: height1)
        titleLabel.frame = titleFrame
        titleLabel.font = UIFont (name: "Arial", size: 18)
        titleLabel.text = titleText
        titleLabel.textColor = textColor
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 8
        titleLabel.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.4)
        self.view.addSubview(titleLabel)
        
        let imageFrame = CGRect(x: xPos2, y: yPos2, width: width2, height: height2)
        imageView.frame = imageFrame
        imageView.image = image
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        self.view.addSubview(imageView)
        
        
        let descriptionFrame = CGRect(x: xPos, y: yPos3, width: width, height: height3)
        descriptionLabel.frame = descriptionFrame
        descriptionLabel.font = UIFont (name: "Arial", size: 14)
        descriptionLabel.text = descriptionText
        descriptionLabel.textColor = textColor
        descriptionLabel.tintColor = UIColor.brownColor()
        descriptionLabel.editable = false
        descriptionLabel.selectable = false
        //descriptionLabel.textAlignment = NSTextAlignment.Center
        //descriptionLabel.layer.masksToBounds = true
        descriptionLabel.layer.cornerRadius = 8
        descriptionLabel.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.4)
        self.view.addSubview(descriptionLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    
    }


}

