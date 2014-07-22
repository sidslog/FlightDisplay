//
//  TableIndicatorDecorator.swift
//  FlightDIsplay
//
//  Created by Sergey Sedov on 12/06/14.
//  Copyright (c) 2014 sidslog. All rights reserved.
//

import UIKit

class TableIndicatorDecorator: UIView {

    var tableInsets: UIEdgeInsets = UIEdgeInsetsZero
    
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */
    
    func indicatorViewChanged(indicatorView: TableIndicatorView) {}

}
