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
    
    @IBInspectable var normalImage: UIImage?
    @IBInspectable var highlightedImage: UIImage?
    @IBInspectable var normalBorderColor: UIColor = UIColor.clearColor()
    @IBInspectable var highlightedBorderColor: UIColor = UIColor.clearColor()
    @IBInspectable var lineWidth: CGFloat = 0.0
    var borderLayer: CAShapeLayer?
    
    override var highlighted: Bool {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        
        var iconImage: UIImage?
        var borderColor = UIColor.clearColor()
        if self.highlighted {
            if let highlightedImage = self.highlightedImage {
                iconImage = highlightedImage
                borderColor = self.highlightedBorderColor
            }
        } else {
            if let normalImage = self.normalImage {
                iconImage = normalImage
                borderColor = self.normalBorderColor
            }
        }
        
        iconImage?.drawInRect(self.bounds)
        
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: CGRectGetWidth(self.bounds) / 2)
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.CGPath
        self.layer.mask = maskLayer;
        
        if self.borderLayer == nil {
            self.borderLayer = CAShapeLayer()
            self.borderLayer!.path = path.CGPath
            self.borderLayer!.fillColor = UIColor.clearColor().CGColor
            self.layer.addSublayer(self.borderLayer!)
        }
        self.borderLayer!.strokeColor = borderColor.CGColor
        self.borderLayer!.lineWidth = self.lineWidth
        self.borderLayer!.lineCap = kCALineCapRound;
    }
}
