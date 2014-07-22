//
//  ViewController.swift
//  FlightDIsplay
//
//  Created by Sergey Sedov on 12/06/14.
//  Copyright (c) 2014 sidslog. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let speedView = TableIndicatorView(frame: CGRectZero)
    let speedDecorator = AirSpeedDecorator(frame: CGRectZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        speedView.frame =  CGRectMake(10, 10, 70, view.bounds.size.height - 20);
        speedView.decorator = speedDecorator
        view.addSubview(speedView)
        
        speedView.maxValue = 300
        speedView.minValue = 50
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onButton(sender : AnyObject) {
        let rand = UInt(arc4random())
        let speed = UInt(speedView.maxValue - speedView.minValue)
        speedView.value = Float(rand % speed) + speedView.minValue
        println("value: \(speedView.value)")
    }

}

