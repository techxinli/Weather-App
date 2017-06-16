//
//  AppStatus.swift
//  Cloud
//
//  Created by 李鑫 on 16/1/2.
//  Copyright © 2016年 Miracle Lee. All rights reserved.
//

import UIKit

class AppStatus: NSObject {
    
    var _hourBezierpath:HourBezierPath!
    var _houly_tmp:NSArray!
    
    fileprivate static let _shareInstance = AppStatus()
    class func shareInstance()->AppStatus{
        
        return _shareInstance
    }
    
    fileprivate override init() {
        
    }


}
