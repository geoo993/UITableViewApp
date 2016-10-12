//
//  ViewController.swift
//  UITableViewApp
//
//  Created by GEORGE QUENTIN on 12/10/2016.
//  Copyright © 2016 GEORGE QUENTIN. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import CoreMotion
import EasyAnimation

class ViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    var msuInt : Observable<Int> = Variable(0).asObservable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.randomColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    
    }


}

