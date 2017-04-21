//
//  ButtonEdgeInsets.swift
//  Button
//
//  Created by lisonglin on 21/04/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

import UIKit

enum LSButtonEdgeInstesStyle {
    //文字在左 图片在右
    case LSButtonEdgeInstesStyleLeft
    //文字在右 图片在左
    case LSButtonEdgeInstesStyleRight
    //文字在上 图片在下
    case LSButtonEdgeInstesStyleTop
    //文字在下 图片在上
    case LSButtonEdgeInstesStyleBottom
}

extension UIButton{
    
    func layoutButtonTitleImageEdgeInsets(btnStyle: LSButtonEdgeInstesStyle, spacing: CGFloat) {
        
        var labelW: CGFloat = 0
        var labelH: CGFloat = 0
        
        let version: Double = Double(UIDevice.current.systemVersion)!
        
        
        if (version >= 8.0){
            labelW = (self.titleLabel?.intrinsicContentSize.width)!
            labelH = (self.titleLabel?.intrinsicContentSize.height)!
        }else {
            labelW = (self.titleLabel?.frame.size.width)!
            labelH = (self.titleLabel?.frame.size.height)!
        }
        
        let imageW: CGFloat = (self.imageView?.frame.size.width)!
        let imageH: CGFloat = (self.imageView?.frame.size.height)!
        
        var imageEdgeInsets : UIEdgeInsets = UIEdgeInsets.zero
        var titleEdgeInsets : UIEdgeInsets = UIEdgeInsets.zero
        
        
        switch btnStyle {
            //文字在左 图片在右
        case .LSButtonEdgeInstesStyleLeft:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelW + spacing / 2, 0, -labelW - spacing / 2)
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageW - spacing / 2, 0, imageW + spacing / 2)
            //文字在右 图片在左
        case .LSButtonEdgeInstesStyleRight:
            imageEdgeInsets = UIEdgeInsetsMake(0, -spacing / 2, 0, spacing / 2)
            titleEdgeInsets = UIEdgeInsetsMake(0, spacing / 2, 0, spacing / 2)
            //文字在下 图片在上
        case .LSButtonEdgeInstesStyleBottom:
            imageEdgeInsets = UIEdgeInsetsMake(-labelH / 2 - spacing / 4, labelW / 2, labelH / 2 + spacing / 4, -labelW / 2 )
            titleEdgeInsets = UIEdgeInsetsMake(imageH / 2 + spacing / 4, -imageW / 2, -imageH / 2 - spacing / 4, imageW / 2)
            //文字在上 图片在下
        case .LSButtonEdgeInstesStyleTop:
            imageEdgeInsets = UIEdgeInsetsMake(labelH / 2 + spacing / 4, labelW / 2, -labelH / 2 - spacing, -labelW / 2)
            titleEdgeInsets = UIEdgeInsetsMake(-imageH / 2 - spacing / 4, -imageW / 2, imageH / 2 + spacing / 4, imageW / 2)

            
        }
        
        self.titleEdgeInsets = titleEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
        
    }
}
