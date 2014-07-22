//
//  TableIndicatorCell.swift
//  FlightDIsplay
//
//  Created by Sergey Sedov on 12/06/14.
//  Copyright (c) 2014 sidslog. All rights reserved.
//

import UIKit

class TableIndicatorCell: UITableViewCell {

    class var yOffsetForText: CGFloat {
        return 14.0
    }
    let separator = UIView()
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
        self.backgroundColor = UIColor.clearColor()
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.textLabel.font = UIFont.systemFontOfSize(10.0)

        separator.backgroundColor = UIColor.grayColor()
        self.addSubview(separator)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        if let text = self.text {
            let width = self.bounds.size.width
            self.textLabel.frame = CGRectMake(10, self.bounds.size.height - TableIndicatorCell.yOffsetForText, width - 10, TableIndicatorCell.yOffsetForText)
            self.textLabel.sizeToFit()
            let labelFrame = self.textLabel.frame
            let minX = CGRectGetMaxX(labelFrame)
            separator.frame = CGRect(x: minX + 5, y: CGRectGetMidY(labelFrame), width: width - minX - 5, height: 1)
        }
    }

}
