//
//  AppStatus.swift
//  Do
//
//  Created by 李鑫 on 15/10/22.
//  Copyright © 2015年 Miracle Lee. All rights reserved.
//

import UIKit


class AppStatus: NSObject {
    
    var _weatherToall:NSMutableArray!
    var _weatherView:WeekWeatherView!
    var _hourBezierpath:HourBezierPath!
    

    
    var _hourly_forecast:NSArray!
    var _houly_tmp:NSMutableArray!
    var _data:NSMutableArray!
        
   
    fileprivate static let _shareInstance = AppStatus()
    class func shareInstance()->AppStatus{
    
        return _shareInstance
    }
    
    fileprivate override init() {
        
    }
    
}


