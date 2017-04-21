//
//  ViewController.swift
//  Button
//
//  Created by lisonglin on 21/04/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.frame = CGRect(x:0,y:0,width:130,height:50)
        btn.setTitle("我是按钮", for: UIControlState.normal)
        btn.backgroundColor = UIColor.orange
        btn.center = self.view.center
        btn.setImage(UIImage.init(named: "jinnang"), for: UIControlState.normal)
        self.view.addSubview(btn)
        
        btn.layoutButtonTitleImageEdgeInsets(btnStyle: .LSButtonEdgeInstesStyleBottom, spacing: 10.0)
        
    }

    
    
    
}

