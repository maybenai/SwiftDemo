//
//  ViewController.swift
//  RatingBar
//
//  Created by lisonglin on 24/04/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let ratingBar = RatingBar.init(CGRect.init(x: 0, y: 0, width: 180, height: 30), unselImg: "ic_ratingbar_star_dark", selImg: "ic_ratingbar_star_light", selCount: 1, enable: true)
        
        
        ratingBar.center = self.view.center
        
        self.view.addSubview(ratingBar)
        
        ratingBar.myColsure = {
        
            (starNum: NSInteger) -> Void in
            
            print(starNum)
        }
        
        
    }

}

