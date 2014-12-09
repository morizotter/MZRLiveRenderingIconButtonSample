//
//  IconButton.swift
//  MZRIconButton
//
//  Created by MORITA NAOKI on 2014/12/09.
//  Copyright (c) 2014年 molabo. All rights reserved.
//

import UIKit

@IBDesignable
class IconButton: UIControl {
    
    @IBInspectable var iconImage: UIImage?
    @IBInspectable var borderColor: UIColor = UIColor.clearColor()
    @IBInspectable var lineWidth: CGFloat = 0.0
    var borderLayer: CAShapeLayer?
    
    override func drawRect(rect: CGRect) {
        
        if let iconImage = self.iconImage {
            iconImage.drawInRect(self.bounds)
        }
        
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: CGRectGetWidth(self.bounds) / 2)
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.CGPath
        self.layer.mask = maskLayer;
        
        if self.borderLayer == nil {
            self.borderLayer = CAShapeLayer()
            self.borderLayer!.path = path.CGPath
            self.borderLayer!.fillColor = UIColor.clearColor().CGColor
        }
        self.borderLayer!.strokeColor = self.borderColor.CGColor
        self.borderLayer!.lineWidth = self.lineWidth
        self.borderLayer!.lineCap = kCALineCapRound;
        self.layer.addSublayer(self.borderLayer!)
    }
}
