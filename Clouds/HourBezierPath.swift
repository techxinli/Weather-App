//
//  HourBezierPath.swift
//  Cloud
//
//  Created by 李鑫 on 16/1/2.
//  Copyright © 2016年 Miracle Lee. All rights reserved.
//

import UIKit

class HourBezierPath: UIView {
    var _bepath:UIBezierPath!
    
    var _danweiLabel:UILabel!
    
    var _todayLabel:UILabel!
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        _danweiLabel = UILabel.init(frame: CGRectMake(frame.size.width-60, 40, 30, 20))
//        _danweiLabel.text = NSString(format:"· 3h") as String
//        _danweiLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
//        _danweiLabel.font = UIFont.boldSystemFontOfSize(12)
//        _danweiLabel.textAlignment = NSTextAlignment.Right
//        addSubview(_danweiLabel)
//        
//        let attriString:NSMutableAttributedString = NSMutableAttributedString.init(string: NSString(format: "TODAY FORECAST").uppercaseStringWithLocale(NSLocale.currentLocale()) as String, attributes: [NSForegroundColorAttributeName:UIColor(red: 0, green: 0, blue: 0, alpha: 0.80)
//            //Avenir-Heavy
//            ,NSFontAttributeName:UIFont(name: "Gill Sans", size: 20)!,NSKernAttributeName:2])
//        _todayLabel = UILabel.init(frame: CGRectMake(frame.size.width/2-100, 0, 200, 20))
//        _todayLabel.textAlignment = NSTextAlignment.Center
//        _todayLabel.attributedText = attriString
//        addSubview(_todayLabel)
        
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.clear
        
        _bepath = UIBezierPath()
        _bepath.lineWidth = 1
        _bepath.lineCapStyle = CGLineCap.round
        _bepath.lineJoinStyle = CGLineJoin.round
        
        let max:Int = AppStatus.shareInstance()._houly_tmp.count
        
        
        for i in 0...max{
            
            let hourW:HourWeather = AppStatus.shareInstance()._houly_tmp.object(at: i) as! HourWeather
            let tmp:CGFloat =  CGFloat(hourW._tmp!.floatValue)
            
            let num:Int = AppStatus.shareInstance()._houly_tmp.count
            
            
            
            let label:UILabel = UILabel.init(frame: CGRect(x: CGFloat(30) + CGFloat(4*i) + CGFloat(i) * (CGFloat(frame.width - 60) - CGFloat(num*4))/(CGFloat(num - 1)), y: 50 - tmp*4, width: 4, height: 4))
            label.layer.cornerRadius = label.frame.width/2
            label.clipsToBounds = true
            label.backgroundColor = UIColor.white
            addSubview(label)
            
            
            
            let tmplabel:UILabel = UILabel.init(frame:CGRect(x: label.frame.origin.x - 10 + 2, y: label.frame.maxY+8, width: 20, height: 10))
            tmplabel.text = NSString(format:"\(hourW._tmp)º" as NSString) as String
            tmplabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
            tmplabel.font = UIFont.systemFont(ofSize: 10)
            
            tmplabel.textAlignment = NSTextAlignment.center
            addSubview(tmplabel)
            
            
            if (i == 0){
                _bepath.move(to: label.center)
            }
                
            else{
                _bepath.addLine(to: label.center)
            }
            
            //print(AppStatus.shareInstance()._houly_tmp.objectAtIndex(i))
            
        }
        
        UIColor.white.setStroke()
        _bepath.stroke()
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
