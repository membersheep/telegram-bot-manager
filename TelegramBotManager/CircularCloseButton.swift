//
//  CircularCloseButton.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 24/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import UIKit

class CircularCloseButton: UIButton {
    
    var circleColor: UIColor = UIColor.redColor() {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var xColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var xScale: CGFloat = 0.4
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutCircleLayer()
        layoutPlus()
    }
    
    // MARK: Private
    
    private var circleLayer: CAShapeLayer?
    private var plusLayer: CAShapeLayer?
    
    private func layoutCircleLayer() {
        if let existingLayer = circleLayer {
            existingLayer.removeFromSuperlayer()
        }
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(ovalInRect: CGRectInset(self.bounds, 3, 3)).CGPath
        shapeLayer.fillColor = circleColor.CGColor
        self.layer.addSublayer(shapeLayer)
        self.circleLayer = shapeLayer
    }
    
    private func layoutPlus() {
        if let existingLayer = plusLayer {
            existingLayer.removeFromSuperlayer()
        }
        
        // Describe "+" path
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(self.bounds.width*(xScale), self.bounds.height*(xScale)))
        path.addLineToPoint(CGPointMake(self.bounds.width*(1 - xScale), self.bounds.height*(1 - xScale)))
        path.moveToPoint(CGPointMake(self.bounds.width*(1 - xScale), self.bounds.height*(xScale)))
        path.addLineToPoint(CGPointMake(self.bounds.width*(xScale), self.bounds.height*(1 - xScale)))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = xColor.CGColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineCap = "round"
        self.layer.addSublayer(shapeLayer)
        self.circleLayer = shapeLayer
    }
}