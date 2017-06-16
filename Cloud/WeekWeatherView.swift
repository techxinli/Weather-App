//
//  WeekWeatherView.swift
//  Cloud
//
//  Created by 李鑫 on 15/12/30.
//  Copyright © 2015年 Miracle Lee. All rights reserved.
//

import UIKit

extension Date {
    func dayOfWeek() -> Int {
    let interval = self.timeIntervalSince1970;
    let days = Int(interval / 86400);
    return (days - 3) % 7;
    }
}

class WeekWeatherView: UIView {

    
  
   
    
    
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override init(frame: CGRect) {
    
        
        
        super.init(frame: frame)
        
        
        print("111111111");
        //let tapgesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: Selector("changeWeather"));
        //tapgesture.delegate = self;
        //self.addGestureRecognizer(tapgesture);
        
     
        
        let mon:NSMutableArray = ["MON","TUE","WED","THU","FRI"]
        let tue:NSMutableArray = ["TUE","WED","THU","FRI","SAT"]
        let wed:NSMutableArray = ["WED","THU","FRI","SAT","SUN"]
        let thu:NSMutableArray = ["THU","FRI","SAT","SUN","MON"]
        let fri:NSMutableArray = ["FRI","SAT","SUN","MON","TUE"]
        let sat:NSMutableArray = ["SAT","SUN","MON","TUE","WED"]
        let sun:NSMutableArray = ["SUN","MON","TUE","WED","THU"]
        let dt = Date();
        let week = dt.dayOfWeek()
       // print(week)
        if (week == 1){
            
            for i in 0 ..< 5 {
                
                
                if (i < AppStatus.shareInstance()._weatherToall.count){
                    let weaInfo:weatherInfo = AppStatus.shareInstance()._weatherToall.object(at: i) as! weatherInfo
                    
                    
                    let attriString:NSMutableAttributedString = NSMutableAttributedString.init(string: NSString(format: "\(mon.object(at: i) as! String)" as NSString).uppercased(with: Locale.current) as String, attributes: [NSForegroundColorAttributeName:UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
                        //Avenir-Heavy
                        ,NSFontAttributeName:UIFont.boldSystemFont(ofSize: 10),NSKernAttributeName:2])
                    
                    var timeLabel:UILabel =  UILabel()
                    timeLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*36 + CGFloat(i)*((frame.width-180-50)/4), y: 20, width: 36, height: 10))
                    timeLabel.attributedText = attriString
                    timeLabel.textAlignment = NSTextAlignment.center
                    
                    let imageView:UIImageView = UIImageView()
                    imageView.frame = CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 40, width: 30, height: 30)
                    imageView.image = UIImage(named: "SnowSmall")
                    addSubview(imageView)
                    
                    
                    //print(weaInfo._code_d)
                    
                    
                    if (weaInfo._code_d.isEqual(to: "100")){
                        
                        imageView.image = UIImage(named:"smallSun")
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "101")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "102")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "103")){
                        
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "104")){
                        
                        imageView.image = UIImage(named:"ying")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "300")){
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "305")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "306")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "307")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "STORM")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "401")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "402")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "403")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "404")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "501")){
                        
                        
                        imageView.image = UIImage(named:"smallmiss")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "502")){
                        
                        
                        imageView.image = UIImage(named:"smallHaze")
                        
                        
                    }
                        
                    else {
                        
                        imageView.image = UIImage(named:"smallSun")
                        
                    }
                    
                    
                    
                    
                    var tmpLabel:UILabel =  UILabel()
                    tmpLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 80, width: 34, height: 10))
                    tmpLabel.text = NSString(format:"\(weaInfo._temp_max!)º" as NSString) as String
                    tmpLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                    //_weather.text = _weatherInfo._currentWeather as String
                    tmpLabel.font = UIFont.boldSystemFont(ofSize: 10)
                    tmpLabel.textAlignment = NSTextAlignment.center
                    addSubview(tmpLabel)
                    
                    
                    
                    //timeLabel.textColor = UIColor.lightGrayColor()
                    addSubview(timeLabel)
                    
                    
                }
            }

            
            
        }
        else if(week == 2){
        
            for i in 0 ..< 5 {
                
                
                if (i < AppStatus.shareInstance()._weatherToall.count){
                    let weaInfo:weatherInfo = AppStatus.shareInstance()._weatherToall.object(at: i) as! weatherInfo
                    
                    
                    let attriString:NSMutableAttributedString = NSMutableAttributedString.init(string: NSString(format: "\(tue.object(at: i) as! String)" as NSString).uppercased(with: Locale.current) as String, attributes: [NSForegroundColorAttributeName:UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
                        //Avenir-Heavy
                        ,NSFontAttributeName:UIFont.boldSystemFont(ofSize: 10),NSKernAttributeName:2])
                    
                    var timeLabel:UILabel =  UILabel()
                    timeLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*36 + CGFloat(i)*((frame.width-180-50)/4), y: 20, width: 36, height: 10))
                    timeLabel.attributedText = attriString
                    timeLabel.textAlignment = NSTextAlignment.center
                    
                    let imageView:UIImageView = UIImageView()
                    imageView.frame = CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 40, width: 30, height: 30)
                    imageView.image = UIImage(named: "SnowSmall")
                    addSubview(imageView)
                    
                    
                    //print(weaInfo._code_d)
                    
                    if (weaInfo._code_d.isEqual(to: "100")){
                        
                        imageView.image = UIImage(named:"smallSun")
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "101")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "102")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "103")){
                        
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "104")){
                        
                        imageView.image = UIImage(named:"ying")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "300")){
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "305")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "306")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "307")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "STORM")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "401")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "402")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "403")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "404")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "501")){
                        
                        
                        imageView.image = UIImage(named:"smallmiss")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "502")){
                        
                        
                        imageView.image = UIImage(named:"smallHaze")
                        
                        
                    }
                        
                    else {
                        
                        imageView.image = UIImage(named:"smallSun")
                        
                    }
                    
                    
                    
                    
                    var tmpLabel:UILabel =  UILabel()
                    tmpLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 80, width: 34, height: 10))
                    tmpLabel.text = NSString(format:"\(weaInfo._temp_max!)º" as NSString) as String
                    tmpLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                    //_weather.text = _weatherInfo._currentWeather as String
                    tmpLabel.font = UIFont.boldSystemFont(ofSize: 10)
                    tmpLabel.textAlignment = NSTextAlignment.center
                    addSubview(tmpLabel)
                    
                    
                    
                    //timeLabel.textColor = UIColor.lightGrayColor()
                    addSubview(timeLabel)
                    
                    
                }
            }

            
            
        }
        
        else if(week == 3){
            
            
                      
            
            for i in 0 ..< 5 {
                
                
                if (i < AppStatus.shareInstance()._weatherToall.count){
                let weaInfo:weatherInfo = AppStatus.shareInstance()._weatherToall.object(at: i) as! weatherInfo
                
                    
                let attriString:NSMutableAttributedString = NSMutableAttributedString.init(string: NSString(format: "\(wed.object(at: i) as! String)" as NSString).uppercased(with: Locale.current) as String, attributes: [NSForegroundColorAttributeName:UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
                    //Avenir-Heavy
                    ,NSFontAttributeName:UIFont.boldSystemFont(ofSize: 10),NSKernAttributeName:2])
                
                var timeLabel:UILabel =  UILabel()
                timeLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*36 + CGFloat(i)*((frame.width-180-50)/4), y: 20, width: 36, height: 10))
                timeLabel.attributedText = attriString
                timeLabel.textAlignment = NSTextAlignment.center
                
               let imageView:UIImageView = UIImageView()
                imageView.frame = CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 40, width: 30, height: 30)
                imageView.image = UIImage(named: "SnowSmall")
                addSubview(imageView)
            
                 
                //print(weaInfo._code_d)
                    
                    
                    if (weaInfo._code_d.isEqual(to: "100")){
                        
                        imageView.image = UIImage(named:"smallSun")
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "101")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "102")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "103")){
                        
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "104")){
                        
                        imageView.image = UIImage(named:"ying")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "300")){
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "305")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "306")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "307")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "STORM")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "401")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "402")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "403")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "404")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "501")){
                        
                        
                        imageView.image = UIImage(named:"smallmiss")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "502")){
                        
                        
                        imageView.image = UIImage(named:"smallHaze")
                        
                        
                    }
                        
                    else {
                        
                        imageView.image = UIImage(named:"smallSun")
                        
                    }
                    
                    
                
                
                var tmpLabel:UILabel =  UILabel()
                tmpLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 80, width: 34, height: 10))
                tmpLabel.text = NSString(format:"\(weaInfo._temp_max!)º" as NSString) as String
                tmpLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                //_weather.text = _weatherInfo._currentWeather as String
                tmpLabel.font = UIFont.boldSystemFont(ofSize: 10)
                tmpLabel.textAlignment = NSTextAlignment.center
                addSubview(tmpLabel)
                
                
                
                //timeLabel.textColor = UIColor.lightGrayColor()
                addSubview(timeLabel)
                
                
            }
            }

            
        }

        else if(week == 4){
            
            for i in 0 ..< 5 {
                
                
                if (i < AppStatus.shareInstance()._weatherToall.count){
                    let weaInfo:weatherInfo = AppStatus.shareInstance()._weatherToall.object(at: i) as! weatherInfo
                    
                    
                    let attriString:NSMutableAttributedString = NSMutableAttributedString.init(string: NSString(format: "\(thu.object(at: i) as! String)" as NSString).uppercased(with: Locale.current) as String, attributes: [NSForegroundColorAttributeName:UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
                        //Avenir-Heavy
                        ,NSFontAttributeName:UIFont.boldSystemFont(ofSize: 10),NSKernAttributeName:2])
                    
                    var timeLabel:UILabel =  UILabel()
                    timeLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*36 + CGFloat(i)*((frame.width-180-50)/4), y: 20, width: 36, height: 10))
                    timeLabel.attributedText = attriString
                    timeLabel.textAlignment = NSTextAlignment.center
                    
                    let imageView:UIImageView = UIImageView()
                    imageView.frame = CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 40, width: 30, height: 30)
                    imageView.image = UIImage(named: "SnowSmall")
                    addSubview(imageView)
                    
                    
                    //print(weaInfo._code_d)
                    
                    
                    if (weaInfo._code_d.isEqual(to: "100")){
                        
                        imageView.image = UIImage(named:"smallSun")
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "101")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "102")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "103")){
                        
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "104")){
                        
                        imageView.image = UIImage(named:"ying")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "300")){
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "305")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "306")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "307")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "STORM")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "401")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "402")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "403")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "404")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "501")){
                        
                        
                        imageView.image = UIImage(named:"smallmiss")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "502")){
                        
                        
                        imageView.image = UIImage(named:"smallHaze")
                        
                        
                    }
                        
                    else {
                        
                        imageView.image = UIImage(named:"smallSun")
                        
                    }
                    
                    
                    
                    var tmpLabel:UILabel =  UILabel()
                    tmpLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 80, width: 34, height: 10))
                    tmpLabel.text = NSString(format:"\(weaInfo._temp_max!)º" as NSString) as String
                    tmpLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                    //_weather.text = _weatherInfo._currentWeather as String
                    tmpLabel.font = UIFont.boldSystemFont(ofSize: 10)
                    tmpLabel.textAlignment = NSTextAlignment.center
                    addSubview(tmpLabel)
                    
                    
                    
                    //timeLabel.textColor = UIColor.lightGrayColor()
                    addSubview(timeLabel)
                    
                    
                }
            }
            

            
        }

        else if(week == 5){
            
            for i in 0 ..< 5 {
                
                
                if (i < AppStatus.shareInstance()._weatherToall.count){
                    let weaInfo:weatherInfo = AppStatus.shareInstance()._weatherToall.object(at: i) as! weatherInfo
                    
                    
                    let attriString:NSMutableAttributedString = NSMutableAttributedString.init(string: NSString(format: "\(fri.object(at: i) as! String)" as NSString).uppercased(with: Locale.current) as String, attributes: [NSForegroundColorAttributeName:UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
                        //Avenir-Heavy
                        ,NSFontAttributeName:UIFont.boldSystemFont(ofSize: 10),NSKernAttributeName:2])
                    
                    var timeLabel:UILabel =  UILabel()
                    timeLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*36 + CGFloat(i)*((frame.width-180-50)/4), y: 20, width: 36, height: 10))
                    timeLabel.attributedText = attriString
                    timeLabel.textAlignment = NSTextAlignment.center
                    
                    let imageView:UIImageView = UIImageView()
                    imageView.frame = CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 40, width: 30, height: 30)
                    imageView.image = UIImage(named: "SnowSmall")
                    addSubview(imageView)
                    
                    
                    //print(weaInfo._code_d)
                    
                    if (weaInfo._code_d.isEqual(to: "100")){
                        
                        imageView.image = UIImage(named:"smallSun")
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "101")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "102")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "103")){
                        
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "104")){
                        
                        imageView.image = UIImage(named:"ying")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "300")){
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "305")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "306")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "307")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "STORM")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "401")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "402")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "403")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "404")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "501")){
                        
                        
                        imageView.image = UIImage(named:"smallmiss")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "502")){
                        
                        
                        imageView.image = UIImage(named:"smallHaze")
                        
                        
                    }
                        
                    else {
                        
                        imageView.image = UIImage(named:"smallSun")
                        
                    }
                    
                    
                    
                    
                    
                    var tmpLabel:UILabel =  UILabel()
                    tmpLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 80, width: 34, height: 10))
                    tmpLabel.text = NSString(format:"\(weaInfo._temp_max!)º" as NSString) as String
                    tmpLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                    //_weather.text = _weatherInfo._currentWeather as String
                    tmpLabel.font = UIFont.boldSystemFont(ofSize: 10)
                    tmpLabel.textAlignment = NSTextAlignment.center
                    addSubview(tmpLabel)
                    
                    
                    
                    //timeLabel.textColor = UIColor.lightGrayColor()
                    addSubview(timeLabel)
                    
                    
                }
            }
            

            
        }
        else if(week == 6){
           
            for i in 0 ..< 5 {
                
                
                if (i < AppStatus.shareInstance()._weatherToall.count){
                    let weaInfo:weatherInfo = AppStatus.shareInstance()._weatherToall.object(at: i) as! weatherInfo
                    
                    
                    let attriString:NSMutableAttributedString = NSMutableAttributedString.init(string: NSString(format: "\(sat.object(at: i) as! String)" as NSString).uppercased(with: Locale.current) as String, attributes: [NSForegroundColorAttributeName:UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
                        //Avenir-Heavy
                        ,NSFontAttributeName:UIFont.boldSystemFont(ofSize: 10),NSKernAttributeName:2])
                    
                    var timeLabel:UILabel =  UILabel()
                    timeLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*36 + CGFloat(i)*((frame.width-180-50)/4), y: 20, width: 36, height: 10))
                    timeLabel.attributedText = attriString
                    timeLabel.textAlignment = NSTextAlignment.center
                    
                    let imageView:UIImageView = UIImageView()
                    imageView.frame = CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 40, width: 30, height: 30)
                    imageView.image = UIImage(named: "SnowSmall")
                    addSubview(imageView)
                    
                    
                    //print(weaInfo._code_d)
                    
                    if (weaInfo._code_d.isEqual(to: "100")){
                        
                        imageView.image = UIImage(named:"smallSun")
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "101")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "102")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "103")){
                        
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "104")){
                        
                        imageView.image = UIImage(named:"ying")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "300")){
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "305")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "306")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "307")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "STORM")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "401")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "402")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "403")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "404")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "501")){
                        
                        
                        imageView.image = UIImage(named:"smallmiss")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "502")){
                        
                        
                        imageView.image = UIImage(named:"smallHaze")
                        
                        
                    }
                        
                    else {
                        
                        imageView.image = UIImage(named:"smallSun")
                        
                    }
                    
                    
                    
                    
                    var tmpLabel:UILabel =  UILabel()
                    tmpLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 80, width: 34, height: 10))
                    tmpLabel.text = NSString(format:"\(weaInfo._temp_max!)º" as NSString) as String
                    tmpLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                    //_weather.text = _weatherInfo._currentWeather as String
                    tmpLabel.font = UIFont.boldSystemFont(ofSize: 10)
                    tmpLabel.textAlignment = NSTextAlignment.center
                    addSubview(tmpLabel)
                    
                    
                    
                    //timeLabel.textColor = UIColor.lightGrayColor()
                    addSubview(timeLabel)
                    
                    
                }
            }

            
        }
        
        else if(week == 7){
            
            for i in 0 ..< 5 {
                
                
                if (i < AppStatus.shareInstance()._weatherToall.count){
                    let weaInfo:weatherInfo = AppStatus.shareInstance()._weatherToall.object(at: i) as! weatherInfo
                    
                    
                    let attriString:NSMutableAttributedString = NSMutableAttributedString.init(string: NSString(format: "\(sun.object(at: i) as! String)" as NSString).uppercased(with: Locale.current) as String, attributes: [NSForegroundColorAttributeName:UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
                        //Avenir-Heavy
                        ,NSFontAttributeName:UIFont.boldSystemFont(ofSize: 10),NSKernAttributeName:2])
                    
                    var timeLabel:UILabel =  UILabel()
                    timeLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*36 + CGFloat(i)*((frame.width-180-50)/4), y: 20, width: 36, height: 10))
                    timeLabel.attributedText = attriString
                    timeLabel.textAlignment = NSTextAlignment.center
                    
                    let imageView:UIImageView = UIImageView()
                    imageView.frame = CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 40, width: 30, height: 30)
                    imageView.image = UIImage(named: "SnowSmall")
                    addSubview(imageView)
                    
                    
                    //print(weaInfo._code_d)
                    
                    if (weaInfo._code_d.isEqual(to: "100")){
                        
                        imageView.image = UIImage(named:"smallSun")
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "101")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "102")){
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "103")){
                        
                        
                        imageView.image = UIImage(named:"smallDuoYUn")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "104")){
                        
                        imageView.image = UIImage(named:"ying")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "300")){
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "305")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "306")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "307")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "STORM")){
                        
                        
                        imageView.image = UIImage(named:"rain")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "401")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "402")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "403")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "404")){
                        
                        
                        imageView.image = UIImage(named:"SnowSmall")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "501")){
                        
                        
                        imageView.image = UIImage(named:"smallmiss")
                        
                        
                    }
                        
                    else if (weaInfo._code_d.isEqual(to: "502")){
                        
                        
                        imageView.image = UIImage(named:"smallHaze")
                        
                        
                    }
                        
                    else {
                        
                        imageView.image = UIImage(named:"smallSun")
                        
                    }
                    
                    
                    
                    
                    var tmpLabel:UILabel =  UILabel()
                    tmpLabel = UILabel.init(frame: CGRect(x: CGFloat(25) + CGFloat(i)*34 + CGFloat(i)*((frame.width-170-50)/4), y: 80, width: 34, height: 10))
                    //print(weaInfo._temp_max)
                    tmpLabel.text = NSString(format:"\(weaInfo._temp_max!)º" as NSString) as String
                    tmpLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                    //_weather.text = _weatherInfo._currentWeather as String
                    tmpLabel.font = UIFont.boldSystemFont(ofSize: 10)
                    tmpLabel.textAlignment = NSTextAlignment.center
                    addSubview(tmpLabel)
                    
                    
                    
                    //timeLabel.textColor = UIColor.lightGrayColor()
                    addSubview(timeLabel)
                    
                    
                }
            }

            
        }


      
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
   
}

//func changeWeather(){
//
//    print("123");
//    
//}
