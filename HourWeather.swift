//
//  HourWeather.swift
//  Cloud
//
//  Created by 李鑫 on 15/12/31.
//  Copyright © 2015年 Miracle Lee. All rights reserved.
//

import UIKit

class HourWeather: NSObject,NSCoding {

    var _tmp:NSString!
    var _time:NSString!
  
    override init(){
        
    }
    
    @objc internal func encode(with aCoder: NSCoder) {
        aCoder.encode(_tmp, forKey: "url")
        aCoder.encode(_time, forKey: "userName")
       
    }
    
    @objc internal required init?(coder aDecoder: NSCoder) {
        _tmp = aDecoder.decodeObject(forKey: "url") as! String as NSString!
        
        _time = aDecoder.decodeObject(forKey: "userName") as? String as NSString!
       
    }
    
    
}


