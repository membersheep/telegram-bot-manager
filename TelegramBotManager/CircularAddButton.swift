//
//  CircularAddButton.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 30/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import UIKit

class CircularAddButton: UIButton {
    
    var circleColor: UIColor = UIColor.redColor() {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var plusColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var plusScale: CGFloat = 0.2
    
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
        path.moveToPoint(CGPointMake(self.bounds.height*(0.5-plusScale/2), self.bounds.width/2))
        path.addLineToPoint(CGPointMake(self.bounds.height*(0.5+plusScale/2), self.bounds.width/2))
        path.moveToPoint(CGPointMake(self.bounds.height/2, self.bounds.width*(0.5+plusScale/2)))
        path.addLineToPoint(CGPointMake(self.bounds.height/2, self.bounds.width*(0.5-plusScale/2)))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = plusColor.CGColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineCap = "round"
        self.layer.addSublayer(shapeLayer)
        self.circleLayer = shapeLayer
    }
}
