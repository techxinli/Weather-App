//
//  WeatherCell.swift
//  Cloud
//
//  Created by 李鑫 on 16/1/2.
//  Copyright © 2016年 Miracle Lee. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    
    var _nowWeather:UILabel!
 
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
        self.initSubView()
    
    }
    
    
    func initSubView(){
    
        let sharedDefaults:UserDefaults = UserDefaults.init(suiteName: "group.Open")!
               ///print(sharedDefaults.objectForKey("NowWeather")!)

        
        _nowWeather = UILabel()
        _nowWeather.frame = CGRect(x: 0, y: 20, width: self.frame.width/3,height: 100)
        _nowWeather.text = NSString(format:"\(sharedDefaults.object(forKey: "NowWeather")!)ºC" as NSString) as String
        _nowWeather.textColor = UIColor.white
        _nowWeather.font = UIFont(name: "Gill Sans", size: 50)
        self.addSubview(_nowWeather)
        
//        let arr:NSArray = sharedDefaults.objectForKey("Hourly") as! NSArray
//        for (var i = 0 ; i < arr.count ; i++){
//            
//        let data:NSData = arr.objectAtIndex(i) as! NSData
//          //NSKeyedUnarchiver.unarchiveObjectWithData(data)HourWeather
//            print(data)
//           
//            let we:HourWeather = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! HourWeather
//            
//            print(we)
//            
//        }
//        
////        let data:NSData = (sharedDefaults.objectForKey("Hourly") as? NSData)!
////        AppStatus.shareInstance()._houly_tmp = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! NSArray
//        
//        print(arr)
//        
      
        
//        
//        if (sharedDefaults.objectForKey("Hourly") != nil){
//            AppStatus.shareInstance()._houly_tmp = sharedDefaults.objectForKey("Hourly") as! NSMutableArray
//            if (AppStatus.shareInstance()._hourBezierpath != nil){
//            
//                AppStatus.shareInstance()._hourBezierpath.removeFromSuperview()
//            }
//            AppStatus.shareInstance()._hourBezierpath = HourBezierPath.init(frame: CGRectMake(self.frame.width/3, 0, self.frame.width/3*2, 100))
//            AppStatus.shareInstance()._hourBezierpath.drawRect(CGRectMake(self.frame.width/3, 0, self.frame.width/3*2, 100))
//            addSubview(AppStatus.shareInstance()._hourBezierpath)
//        
//        }
//      
        
        
    }
    
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
