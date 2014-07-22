//
//  Utils.swift
//  FlightDIsplay
//
//  Created by Sergey Sedov on 12/06/14.
//  Copyright (c) 2014 sidslog. All rights reserved.
//

import UIKit

class Utils: NSObject {
    class func applyInsets(rect: CGRect, insets: UIEdgeInsets)->CGRect {
        return CGRectMake(CGRectGetMinX(rect)+insets.left, CGRectGetMinY(rect)+insets.top, CGRectGetWidth(rect)-insets.left-insets.right, CGRectGetHeight(rect)-insets.top-insets.bottom);
    }

}
