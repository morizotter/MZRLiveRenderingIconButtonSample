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
    
    lazy var circlePath: UIBezierPath = {
        return UIBezierPath(roundedRect: self.bounds, cornerRadius: CGRectGetWidth(self.bounds) / 2)
    }()
    var borderLayer: CAShapeLayer?
    
    override var highlighted: Bool {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        let maskLayer = CAShapeLayer()
        maskLayer.path = self.circlePath.CGPath
        self.layer.mask = maskLayer;
        
        self.borderLayer = CAShapeLayer()
        self.borderLayer!.path = self.circlePath.CGPath
        self.borderLayer!.fillColor = UIColor.clearColor().CGColor
        self.layer.addSublayer(self.borderLayer!)
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
        
        self.borderLayer!.strokeColor = borderColor.CGColor
        self.borderLayer!.lineWidth = self.lineWidth
    }
}
