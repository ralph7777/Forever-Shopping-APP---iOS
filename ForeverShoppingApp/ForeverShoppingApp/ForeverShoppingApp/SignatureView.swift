//
//  SignatureView.swift
//  ForeverShoppingApp
//
//  Created by Zhang, Kuangyi on 3/7/18.
//  Copyright © 2018 Zhang, Kuangyi. All rights reserved.
//

import UIKit

class SignatureView: UIView {

    var color: UIColor = UIColor.black
    var first: CGPoint = CGPoint.zero
    var last : CGPoint = CGPoint.zero
    var points: [CGPoint] = []
    
    // Only override drawRect: if you perform custom drawing.
    override func draw(_ rect: CGRect) {
        //Drawing code
        //guard let context = UIGraphicsGetCurrentContext() else { return }
        if let context = UIGraphicsGetCurrentContext() {
            context.setStrokeColor(color.cgColor)
            context.setFillColor(color.cgColor)
            context.move(to: CGPoint(x: first.x, y: first.y))
            for p in points {
                context.addLine(to: CGPoint(x: p.x, y: p.y))
            }
            context.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            first = touch.location(in: self)
            last = first
            points.removeAll(keepingCapacity: true)
            points.append(first)
            setNeedsDisplay()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            last = touch.location(in: self)
            points.append(last)
            setNeedsDisplay()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            last = touch.location(in: self)
            points.append(last)
            setNeedsDisplay()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

}
