//
//  WelcomView.swift
//  ForeverShoppingApp
//
//  Created by Zhang, Kuangyi on 3/9/18.
//  Copyright © 2018 Zhang, Kuangyi. All rights reserved.
//

import UIKit

class WelcomView: UIView {

    override func draw(_ rect: CGRect) {
        // Drawing text
        let text =  "\(userFName) \(userLName)"
        
        let textAttr : [NSAttributedStringKey : Any] = [
            .foregroundColor : UIColor.black,
            .font : UIFont(name: "Cochin", size: 40)!
        ]
        let x:Int = 150 - (userLName.count + userFName.count) * 10
        text.draw(at: CGPoint(x: x, y: 10), withAttributes: textAttr)
        
        // Drawing an image
        if let image = UIImage(named: "Welcome") {
            let rect = CGRect(x: 10, y: 70, width: 285, height: 180)
            image.draw(in: rect)
        }
        
        

    }
}
