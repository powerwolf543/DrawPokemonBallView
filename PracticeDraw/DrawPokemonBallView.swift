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
    private let innerCircleLayer = CAShapeLayer()
    
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
        let borderWidth:CGFloat = 10.0
        
        let upperPath = UIBezierPath()
        upperPath.addArcWithCenter(theBallCenterPoint,
                                   radius: theBallRadius,
                                   startAngle: -CGFloat(M_PI),
                                   endAngle: 0, clockwise: true)
        
        upperBallLayer.path = upperPath.CGPath

        if upperBallLayer.superlayer == nil {
            upperBallLayer.fillColor = UIColor.redColor().CGColor
            upperBallLayer.strokeColor = UIColor.blackColor().CGColor
            upperBallLayer.lineWidth = borderWidth
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
            bottomBallLayer.lineWidth = borderWidth
            layer.addSublayer(bottomBallLayer)
        }
        
        let middleLinePath = UIBezierPath()
        middleLinePath.moveToPoint(CGPointMake(theBallCenterPoint.x - theBallRadius,theBallCenterPoint.y))
        middleLinePath.addLineToPoint(CGPointMake(theBallCenterPoint.x + theBallRadius,theBallCenterPoint.y))
        middleLineLayer.path = middleLinePath.CGPath

        if middleLineLayer.superlayer == nil {
            middleLineLayer.fillColor = UIColor.whiteColor().CGColor
            middleLineLayer.strokeColor = UIColor.blackColor().CGColor
            middleLineLayer.lineWidth = borderWidth
            layer.addSublayer(middleLineLayer)
        }
        
        let innerBlackCirclePath = UIBezierPath()
        innerBlackCirclePath.addArcWithCenter(theBallCenterPoint,
                                              radius: theBallRadius * 0.2,
                                              startAngle: 0,
                                              endAngle: 2 * CGFloat(M_PI), clockwise: false)
        
        innerCircleLayer.path = innerBlackCirclePath.CGPath
        
        if innerCircleLayer.superlayer == nil {
            innerCircleLayer.fillColor = UIColor.whiteColor().CGColor
            innerCircleLayer.strokeColor = UIColor.blackColor().CGColor
            innerCircleLayer.lineWidth = borderWidth
            layer.addSublayer(innerCircleLayer)
        }
    }
}
