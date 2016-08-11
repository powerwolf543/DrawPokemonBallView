//
//  DrawPokemonBallView.swift
//  PracticeDraw
//
//  Created by NixonShih on 2016/8/11.
//  Copyright © 2016年 Nixon. All rights reserved.
//

import UIKit

@IBDesignable
class DrawPokemonBallView: UIView {
    
    private let bottomBallLayer = CAShapeLayer()
    private let upperBallLayer = CAShapeLayer()
    private let middleLineLayer = CAShapeLayer()
    private let innerBlackCircleLayer = CAShapeLayer()
    private let innerWhiteCircleLayer = CAShapeLayer()
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        drawPokemonBall()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawPokemonBall()
    }
    
    private func drawPokemonBall() {
        let theBallRadius = CGRectGetHeight(bounds)/2
        let theBallCenterPoint = CGPointMake(CGRectGetMidX(bounds),CGRectGetMidY(bounds))
        
        let upperPath = UIBezierPath()
        upperPath.addArcWithCenter(theBallCenterPoint,
                                   radius: theBallRadius,
                                   startAngle: -CGFloat(M_PI),
                                   endAngle: 0, clockwise: true)
        
        upperBallLayer.path = upperPath.CGPath

        if upperBallLayer.superlayer == nil {
            upperBallLayer.fillColor = UIColor.redColor().CGColor
            upperBallLayer.strokeColor = UIColor.blackColor().CGColor
            upperBallLayer.lineWidth = 10.0
            layer.addSublayer(upperBallLayer)
        }
        
        let bottomPath = UIBezierPath()
        bottomPath.addArcWithCenter(theBallCenterPoint,
                                    radius: theBallRadius,
                                    startAngle: -CGFloat(M_PI),
                                    endAngle: 0, clockwise: false)
        
        bottomBallLayer.path = bottomPath.CGPath

        if bottomBallLayer.superlayer == nil {
            bottomBallLayer.fillColor = UIColor.whiteColor().CGColor
            bottomBallLayer.strokeColor = UIColor.blackColor().CGColor
            bottomBallLayer.lineWidth = 10.0
            layer.addSublayer(bottomBallLayer)
        }
        
        let middleLinePath = UIBezierPath()
        middleLinePath.moveToPoint(CGPointMake(theBallCenterPoint.x - theBallRadius,theBallCenterPoint.y))
        middleLinePath.addLineToPoint(CGPointMake(theBallCenterPoint.x + theBallRadius,theBallCenterPoint.y))
        middleLineLayer.path = middleLinePath.CGPath

        if middleLineLayer.superlayer == nil {
            middleLineLayer.fillColor = UIColor.whiteColor().CGColor
            middleLineLayer.strokeColor = UIColor.blackColor().CGColor
            middleLineLayer.lineWidth = 10.0
            layer.addSublayer(middleLineLayer)
        }
        
        let innerBlackCirclePath = UIBezierPath()
        innerBlackCirclePath.addArcWithCenter(theBallCenterPoint,
                                              radius: theBallRadius * 0.2,
                                              startAngle: 0,
                                              endAngle: 2 * CGFloat(M_PI), clockwise: false)
        
        innerBlackCircleLayer.path = innerBlackCirclePath.CGPath
        
        if innerBlackCircleLayer.superlayer == nil {
            innerBlackCircleLayer.fillColor = UIColor.blackColor().CGColor
            layer.addSublayer(innerBlackCircleLayer)
        }
        
        let innerWhiteCirclePath = UIBezierPath()
        innerWhiteCirclePath.addArcWithCenter(theBallCenterPoint,
                                              radius: theBallRadius * 0.2 - 10,
                                              startAngle: 0,
                                              endAngle: 2 * CGFloat(M_PI), clockwise: false)
        
        innerWhiteCircleLayer.path = innerWhiteCirclePath.CGPath
        
        if innerWhiteCircleLayer.superlayer == nil {
            innerWhiteCircleLayer.fillColor = UIColor.whiteColor().CGColor

            layer.addSublayer(innerWhiteCircleLayer)
        }
    }
}
