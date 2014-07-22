//
//  AirSpeedDecorator.swift
//  FlightDIsplay
//
//  Created by Sergey Sedov on 12/06/14.
//  Copyright (c) 2014 sidslog. All rights reserved.
//

import UIKit

class AirSpeedDecorator: TableIndicatorDecorator {

    let title = UILabel()
    let indicator = UIView()
    
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
        tableInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        title.textAlignment = NSTextAlignment.Center
        indicator.backgroundColor = UIColor.blackColor()
        self.addSubview(title)
        self.addSubview(indicator)
    }

    override func willMoveToSuperview(newSuperview: UIView!) {
        if newSuperview {
            title.frame = CGRectMake(0, 0, newSuperview.bounds.size.width, 40)
            
            let tableFrame = Utils.applyInsets(newSuperview.bounds, insets: tableInsets);
            indicator.frame = CGRectMake(0, CGRectGetMidY(tableFrame) - 1, newSuperview.bounds.size.width, 2)
        }
    }
    
    override func indicatorViewChanged(indicatorView: TableIndicatorView) {
        title.text = "\(indicatorView.value)"
    }

}
