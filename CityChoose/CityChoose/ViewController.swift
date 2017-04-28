//
//  ViewController.swift
//  CityChoose
//
//  Created by lisonglin on 27/04/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLayoutSubviews() {
        self.resultLabel.layer.cornerRadius = 5
        self.resultLabel.layer.borderWidth = 0.5
        self.resultLabel.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }


    @IBAction func selectedBtnClick() {
        let cityView = CityChooseView.init(frame: self.view.bounds)
        
        cityView.myClosure = { (provinceStr: String, cityStr: String , areaStr: String) -> Void in
            
            self.resultLabel.text = provinceStr + cityStr + areaStr
            
        }
        
        self.view.addSubview(cityView)
    }


}

