//
//  ViewController.swift
//  test
//
//  Created by ono on 2019/04/11.
//  Copyright © 2019 ono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stripeView: ColorStripesView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colors: [UIColor] = makeRandomColors()
        stripeView.colors = colors
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func makeRandomColors() -> [UIColor] {
        
        var colors: [UIColor] = []
        var i = 0
        let num = Int(arc4random_uniform(300))
        while i < num {
            colors.append(UIColor(red: CGFloat(Double(arc4random_uniform(255))/255.0), green: CGFloat(Double(arc4random_uniform(255))/255.0), blue: CGFloat(Double(arc4random_uniform(255))/255.0), alpha: 1.0))
            i += 1
        }
        return colors
    }

    @IBAction func drawAct(_ sender: Any) {
        
        let colors: [UIColor] = makeRandomColors()
        stripeView.colors = colors
    }
    
}

