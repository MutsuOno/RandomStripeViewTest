//
//  ColorStripesView.swift
//  test
//
//  Created by ono on 2019/04/11.
//  Copyright © 2019 ono. All rights reserved.
//

import UIKit

class ColorStripesView: UIView {
    
    var colors: [UIColor]? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    init(frame: CGRect, colors: [UIColor]) {
        super.init(frame: frame)
        self.colors = colors
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        drawStripe(rect: rect)
    }
    
    func drawStripe(rect: CGRect) {
        
        let width: CGFloat = self.frame.width
        let height: CGFloat = self.frame.height
        let size = CGSize(width: width, height: height)
        let oneWidth: CGFloat = width / CGFloat(self.colors!.count)
        
        // Generate pattern
        let context = UIGraphicsGetCurrentContext()
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        for (i, color) in (self.colors?.enumerated())! {
            
            let colorPath = UIBezierPath(rect: CGRect(x: oneWidth * CGFloat(i), y: 0, width: oneWidth, height: height))
            color.setFill()
            colorPath.fill()
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Draw pattern in view
        UIColor(patternImage: image!).setFill()
        context!.fill(rect)
    }

}
