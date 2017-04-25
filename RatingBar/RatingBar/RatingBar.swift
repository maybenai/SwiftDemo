//
//  RatingBar.swift
//  RatingBar
//
//  Created by lisonglin on 24/04/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

import UIKit



let DEFAULT_STAR_COUNT = 5
var SCALE: CGFloat = 0.5

typealias ChangeStarColsure = (_ starNum:NSInteger) -> Void

class RatingBar: UIView {

    var unselImg: NSString = ""
    var selImg: NSString = ""
    var starCount: NSInteger = 0
    var enable: Bool = false
    
    var bottomView =  UIView()
    var topView = UIView()
    
    var finalStarNum: NSInteger = 0
    
    var starWidth: CGFloat = 0
    
    var myColsure: ChangeStarColsure?
    
    
    
    init(_ frame:CGRect, unselImg:NSString, selImg:NSString, selCount:NSInteger, enable:Bool) {
        
        super.init(frame: frame)
        
        self.unselImg = unselImg
        self.selImg = selImg
        self.enable = enable
        self.starCount = selCount
        
        //添加手势
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(RatingBar.tap))
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(RatingBar.pan))
        self.addGestureRecognizer(tap)
        self.addGestureRecognizer(pan)
        
        self.initWithStarCount(count: self.starCount)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initWithStarCount(count: NSInteger)  {
        
        self.bottomView = UIView.init(frame: self.bounds)
        self.topView = UIView.init(frame: CGRect(x:0, y:0 , width:0,height:0))
        
        self.topView.clipsToBounds = true
        self.bottomView.isUserInteractionEnabled = false
        self.topView.isUserInteractionEnabled = false
        self.isUserInteractionEnabled = true
        self.addSubview(bottomView)
        self.addSubview(topView)
        
        starWidth = self.frame.size.width / 7 * SCALE
        
        for i in 0...4 {
            let unselImg = UIImageView.init(frame: CGRect(x:0 + starWidth * (CGFloat(Float(i))),y:(self.frame.height - starWidth) / 2, width:starWidth,height: starWidth))

            unselImg.image = UIImage.init(named: self.unselImg as String)
            
            self.bottomView.addSubview(unselImg)
            
            let selImg = UIImageView.init(frame: unselImg.frame)
            selImg.center = unselImg.center
            selImg.image = UIImage.init(named: self.selImg as String)
            self.topView.addSubview(selImg)
            
        }
        
        if self.starCount > 0 {
            self.topView.frame = CGRect(x:0,y:0, width:self.starWidth * CGFloat(Float(self.starCount)), height:self.bounds.size.height)
        }
    }
    
    
    
    func tap(gesture: UITapGestureRecognizer) {
        
        if self.enable == true {
            let point = gesture.location(in: self)
            var count = (Int)(point.x / self.starWidth) + 1
            self.topView.frame = CGRect(x:0,y:0, width:self.starWidth * CGFloat(Float(count)) , height:self.bounds.size.height)
            
            if count > 5 {
                self.finalStarNum = DEFAULT_STAR_COUNT
            }else {
                self.finalStarNum = count
            }
            
            if count == 0 {
                count = 1
               self.topView.frame = CGRect(x:0,y:0, width:self.starWidth * CGFloat(Float(count)) , height:self.bounds.size.height)
            }
        
            if self.myColsure != nil {
                self.myColsure!(self.finalStarNum)
            }
        }
    }
    
    func pan(gesture: UIPanGestureRecognizer) {
        
        if self.enable == true {
            let point = gesture.location(in: self)
            var count = (Int)(point.x / self.starWidth)

            if count > 1 && count <= DEFAULT_STAR_COUNT && self.finalStarNum != count {
                
                self.topView.frame = CGRect(x:0,y:0, width:self.starWidth * CGFloat(Float(count + 1)), height:self.bounds.size.height)
                
                self.finalStarNum = count + 1
                
            }
            
            if count == 0 {
                count = 1
                self.topView.frame = CGRect(x:0,y:0, width:self.starWidth * CGFloat(Float(1)), height:self.bounds.size.height)
                self.finalStarNum = count
            }
            
            if self.myColsure != nil {
                self.myColsure!(self.finalStarNum)
            }
            
        }

        
        
    }
    
    

}
