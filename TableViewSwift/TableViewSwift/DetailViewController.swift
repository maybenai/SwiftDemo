//
//  DetailViewController.swift
//  TableViewSwift
//
//  Created by lisonglin on 14/04/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var text: String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let label = UILabel(frame:CGRect(x:0,y:0,width:200,height:50))
        
        label.center = self.view.center
        
        self.view .addSubview(label)
        
        label.backgroundColor = UIColor.orange
        
        label.text = text
        
        label.layer.borderColor = UIColor.black.cgColor
        
        label.layer.borderWidth = 0.2
        
        label.textAlignment = NSTextAlignment.center
        
        label.font = UIFont.systemFont(ofSize: 14)
    }

}
