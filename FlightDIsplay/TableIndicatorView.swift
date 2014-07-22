//
//  AirSpeedView.swift
//  FlightDIsplay
//
//  Created by Sergey Sedov on 12/06/14.
//  Copyright (c) 2014 sidslog. All rights reserved.
//

import UIKit

class TableIndicatorView: UIView, UITableViewDataSource {

    
    let tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
    
    var decorator: TableIndicatorDecorator?
    
    var rowCount: Int = 25
    
    var value: Float = 0 {
        willSet(newValue) {
            let allHeight = tableView.rowHeight * Float(rowCount)
            
            let valueDiff = (newValue - minValue)
            let maxDiff = (maxValue - minValue)
            let diff = 1 - valueDiff / maxDiff
            let offset = allHeight * diff - tableView.bounds.size.height / 2 - TableIndicatorCell.yOffsetForText / 2
            
            tableView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
            
        }
    
        didSet(newValue) {
            if let dec = decorator {
                dec.indicatorViewChanged(self)
            }
        }
    }
    
    var minValue: Float = 0 {
        willSet(newMinValue) {
            tableView.reloadData()
        }
    }
    
    var maxValue: Float = 0 {
        willSet(newMaxValue) {
            tableView.reloadData()
        }
    }
    
    init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.dataSource = self
        tableView.registerClass(TableIndicatorCell.self, forCellReuseIdentifier: "IndicatorCell")
        tableView.backgroundColor = UIColor.clearColor()
        tableView.rowHeight = 40
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None

        self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.1)
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        
        
        self.addSubview(tableView)
    }
    
    override func willMoveToSuperview(newSuperview: UIView!)  {        
        if newSuperview {
            var tableFrame = self.bounds;
            if let dec = decorator {
                
                dec.frame = tableFrame
                self.addSubview(dec)
                
                let insets = dec.tableInsets
                tableFrame = Utils.applyInsets(tableFrame, insets: insets);
                
            }
            tableView.frame = tableFrame
        }
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("IndicatorCell", forIndexPath: indexPath) as TableIndicatorCell
        let value = Float(rowCount - indexPath.row - 1) * (maxValue - minValue) / Float(rowCount)
        cell.text = "\(minValue + value)"
        return cell
    }

}
