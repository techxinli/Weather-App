//
//  ViewController.swift
//  Cloud
//
//  Created by 李鑫 on 15/12/29.
//  Copyright © 2015年 Miracle Lee. All rights reserved.
//

import CoreLocation
import UIKit
import MapKit


class ViewController: UIViewController,CLLocationManagerDelegate {

    var _weatherInfo:weatherInfo!
    var _dic:NSDictionary!
    var locationManager:CLLocationManager!
    
    var _weatherImage:UIImageView!
    var _currentWeather:UILabel!
    var _place:UILabel!
    var _weather:UILabel!
    var _weatherView:WeekWeatherView!

    
    var _pathBtn:UIButton!
    var _allBtn:UIButton!
    var _isChange:Bool!
    
   

    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        _isChange = false
        _weatherInfo = weatherInfo()
        self.initSubView()
        self.view.backgroundColor = UIColor.white
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initSubView(){
    
        _weatherImage = UIImageView()
        _weatherImage.frame = CGRect(x: self.view.frame.width/2-30, y: self.view.frame.height/10, width: 60, height: 60)
        self.view.addSubview(_weatherImage)
        
        
        _currentWeather = UILabel.init(frame: CGRect(x: 0, y: _weatherImage.frame.maxY+10, width: self.view.frame.width, height: 20))
        _currentWeather.textAlignment = NSTextAlignment.center
        _currentWeather.textColor = UIColor.black
       // _currentWeather.text = "PARTLY  CLOUDY"
       // _currentWeather.attributedText = attriString1
        _currentWeather.font = UIFont(name: "Gill Sans", size: 17)
        self.view.addSubview(_currentWeather)
        

        _place = UILabel.init(frame: CGRect(x: 0, y: _currentWeather.frame.maxY+10, width: self.view.frame.width, height: 20))
        _place.textAlignment = NSTextAlignment.center
        _place.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        //_place.text = "HAIDIAN. CN"
        //_place.attributedText = attriString
        _place.font = UIFont(name: "Avenir-Heavy", size: 12)
       
        self.view.addSubview(_place)
        
        _weather = UILabel.init(frame: CGRect(x: 0, y: _place.frame.maxY+50, width: self.view.frame.width, height: 100))
        _weather.textAlignment = NSTextAlignment.center
        _weather.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        //_weather.text = _weatherInfo._currentWeather as String
        _weather.font = UIFont(name: "AvenirNext-UltraLight", size: 120)
        self.view.addSubview(_weather)
        
        _pathBtn = UIButton.init(frame: CGRect(x: self.view.frame.width/2-20, y: self.view.frame.height-80, width: 40, height: 40))
        _pathBtn.setImage(UIImage(named: "Path"), for: UIControlState())
        _pathBtn.addTarget(self, action: #selector(ViewController.path), for: UIControlEvents.touchUpInside)
        _pathBtn.isUserInteractionEnabled = false
        self.view.addSubview(_pathBtn)
        
        _allBtn = UIButton.init(frame: CGRect(x: self.view.frame.width/2-20, y: self.view.frame.height-80, width: 40, height: 40))
        _allBtn.setImage(UIImage(named: "Path"), for: UIControlState())
        _allBtn.addTarget(self, action: Selector(("allThing")), for: UIControlEvents.touchUpInside)
        _allBtn.alpha = 0
        self.view.addSubview(_allBtn)
        
        
    }
    
    func path(){
    
        if (_isChange == false){
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
           
            self._weatherImage.alpha = 0
            self._currentWeather.alpha = 0
            self._place.alpha = 0
            self._weather.alpha = 0
            AppStatus.shareInstance()._hourBezierpath.alpha = 1
            self._isChange = true
        }) 
        }
        
       else if (_isChange == true){
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                
                self._weatherImage.alpha = 1
                self._currentWeather.alpha = 1
                self._place.alpha = 1
                self._weather.alpha = 1
                self._isChange = false
                AppStatus.shareInstance()._hourBezierpath.alpha = 0

              
            }) 
        }

        
        
       
        
        
    
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        let location = locations.last! as CLLocation
        self.getInfoWithlocation(location)
        
    }
    
     func getForecastInfoWithlocation(_ location:CLLocation){
    
        
         //print(_weatherInfo._cityName)
        
        let str2 = NSString(format:"https://free-api.heweather.com/v5/weather?city=\(_weatherInfo._cityName.lowercased)&key=77f1d081d122431f9fa9a4f6784d4131" as NSString)
        //let str2 = NSString(format:"https://free-api.heweather.com/v5/weather?city=\(self._weatherInfo._cityName)&key=\(self._weatherInfo._cityName)" as NSString);
        
       
        do {
            
         
            
            let opt = try HTTP.POST(str2 as String, parameters: nil)
            opt.start { response in
                
                do{
                    self._dic = NSDictionary()
                    try self._dic = JSONSerialization.jsonObject(with: (response.data), options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    //print(self._dic)
                    let TopList:NSArray = self._dic["HeWeather5"] as! NSArray
                    let secondlist:NSDictionary = TopList.object(at: 0) as! NSDictionary
                    let Weatherlist:NSArray = secondlist["daily_forecast"] as! NSArray
                    
                    AppStatus.shareInstance()._houly_tmp.removeAllObjects()
                    
                    AppStatus.shareInstance()._hourly_forecast = secondlist["hourly_forecast"] as! NSArray
                    
                
                    //print(AppStatus.shareInstance()._hourly_forecast)
                    
                    
                    AppStatus.shareInstance()._weatherToall.removeAllObjects()
                    for i in 0 ..< 7{
                        
                        
                        let dailyDic:NSDictionary = Weatherlist.object(at: i) as! NSDictionary
                        let dayWeather:weatherInfo = weatherInfo()
                        dayWeather._sunrise = (dailyDic["astro"] as! NSDictionary)["sr"] as! NSString
                        dayWeather._sunset = (dailyDic["astro"]as! NSDictionary)["ss"] as! NSString
                        dayWeather._time = dailyDic["date"] as! NSString
                        dayWeather._hum = dailyDic["hum"] as! NSString
                        
                        dayWeather._temp_max = (dailyDic["tmp"]as! NSDictionary)["max"] as! NSString
                        dayWeather._temp_min = (dailyDic["tmp"]as! NSDictionary)["min"] as! NSString
                        dayWeather._vis = dailyDic["vis"] as! NSString
                        dayWeather._widDeg = (dailyDic["wind"]as! NSDictionary)["deg"] as! NSString
                        dayWeather._widSpd = (dailyDic["wind"]as! NSDictionary)["spd"] as! NSString
                        
                        
                        dayWeather._code_night = (dailyDic["cond"]as! NSDictionary)["code_n"] as! NSString
                        
                        if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "100")){
                            
                            dayWeather._code_day = "CLEAR"
                            dayWeather._code_d = "100"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "101")){
                            
                            dayWeather._code_day = "CLOUDY"
                             dayWeather._code_d = "101"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "102")){
                            
                            dayWeather._code_day = "FEW CLOUDS"
                             dayWeather._code_d = "102"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "103")){
                            
                            dayWeather._code_day = "PARTY CLOUDY"
                             dayWeather._code_d = "103"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "104")){
                            
                            dayWeather._code_day = "OVERCAST"
                             dayWeather._code_d = "104"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "300")){
                            
                            dayWeather._code_day = "SHOWER RAIN"
                             dayWeather._code_d = "300"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "305")){
                            
                            dayWeather._code_day = "LIGHT RAIN"
                            dayWeather._code_d = "305"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "306")){
                            
                            dayWeather._code_day = "MODERATE RAIN"
                             dayWeather._code_d = "306"
                            
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "307")){
                            
                            dayWeather._code_day = "HEAVY RAIN"
                             dayWeather._code_d = "307"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "209")){
                            
                            dayWeather._code_day = "STORM"
                             dayWeather._code_d = "209"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "401")){
                            
                            dayWeather._code_day = "LIGHT SNOW"
                             dayWeather._code_d = "401"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "402")){
                            
                            dayWeather._code_day = "MODERATE SNOW"
                             dayWeather._code_d = "402"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "403")){
                            
                            dayWeather._code_day = "HEAVY SNOW"
                             dayWeather._code_d = "403"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "404")){
                            
                            dayWeather._code_day = "SLEET"
                             dayWeather._code_d = "404"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "501")){
                            
                            dayWeather._code_day = "FOGGY"
                             dayWeather._code_d = "501"
                            
                        }
                            
                        else if (((dailyDic["cond"]as! NSDictionary)["code_d"] as! NSString).isEqual(to: "502")){
                            
                            dayWeather._code_day = "HAZE"
                             dayWeather._code_d = "502"
                            
                        }
                            
                        else {
                            
                            dayWeather._code_day = "PARTLY CLEAR"
                            dayWeather._code_d = "100"

                            
                        }
                        
                        AppStatus.shareInstance()._weatherToall.add(dayWeather)
                        
                    }
                    
                    let mainDic:NSDictionary = secondlist["now"] as! NSDictionary
                    let code:NSString = (mainDic["cond"]as! NSDictionary)["code"] as! NSString

                    
                    self._weatherInfo._currenttemp = NSString(format:"\(mainDic["tmp"]!)" as NSString)
                    let houlyweather:HourWeather = HourWeather()
                    houlyweather._tmp = self._weatherInfo._currenttemp
                    
                    let data:Data = NSKeyedArchiver.archivedData(withRootObject: houlyweather)
                    AppStatus.shareInstance()._data.add(data)
                    
                    AppStatus.shareInstance()._houly_tmp.add(houlyweather)
                    

                    
                    for i in 0 ..< AppStatus.shareInstance()._hourly_forecast.count{
                        
                        let hourDic:NSDictionary = AppStatus.shareInstance()._hourly_forecast.object(at: i) as! NSDictionary
                        let houlyweather:HourWeather = HourWeather()
                        houlyweather._time = hourDic["date"] as! NSString
                        houlyweather._tmp = hourDic["tmp"] as! NSString
                        AppStatus.shareInstance()._houly_tmp.add(houlyweather)
                        
                        let data:Data = NSKeyedArchiver.archivedData(withRootObject: houlyweather)
                        AppStatus.shareInstance()._data.add(data)
                        
                        
                    }
                    
                    

                    
                    
                    
                    
                    //print(mainDic)
                    
                    var weather:NSString!
                    
                    
                    
            

                    
                    

                    
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        
                        //                        if (AppStatus.shareInstance()._hourBezierpath != nil){
                        //
                        //                            AppStatus.shareInstance()._hourBezierpath.removeFromSuperview()
                        //                        }
                        

                        if (code.isEqual(to: "100")){
                            
                            weather = "CLEAR"
                            self._weatherImage.image = UIImage(named:"Sun")
                        }
                            
                        else if (code.isEqual(to: "101")){
                            
                            weather = "CLOUDY"
                            self._weatherImage.image = UIImage(named:"DuoYun")
                            
                        }
                            
                        else if (code.isEqual(to: "102")){
                            
                            weather = "FEW CLOUDS"
                            self._weatherImage.image = UIImage(named:"DuoYun")
                            
                        }
                            
                        else if (code.isEqual(to: "103")){
                            
                            weather = "PARTY CLOUDY"
                            self._weatherImage.image = UIImage(named:"DuoYun")
                            
                        }
                            
                        else if (code.isEqual(to: "104")){
                            
                            weather = "OVERCAST"
                            self._weatherImage.image = UIImage(named:"ying")
                            
                        }
                            
                        else if (code.isEqual(to: "300")){
                            
                            weather = "SHOWER RAIN"
                            self._weatherImage.image = UIImage(named:"rain")
                            
                        }
                            
                        else if (code.isEqual(to: "305")){
                            
                            weather = "LIGHT RAIN"
                            self._weatherImage.image = UIImage(named:"rain")
                            
                        }
                            
                        else if (code.isEqual(to: "306")){
                            
                            weather = "MODERATE RAIN"
                            self._weatherImage.image = UIImage(named:"rain")
                            
                            
                        }
                            
                        else if (code.isEqual(to: "307")){
                            
                            weather = "HEAVY RAIN"
                            self._weatherImage.image = UIImage(named:"rain")
                            
                        }
                            
                        else if (code.isEqual(to: "STORM")){
                            
                            weather = "STORM"
                            self._weatherImage.image = UIImage(named:"rain")
                            
                        }
                            
                        else if (code.isEqual(to: "401")){
                            
                            weather = "LIGHT SNOW"
                            self._weatherImage.image = UIImage(named:"Snow")
                            
                        }
                            
                        else if (code.isEqual(to: "402")){
                            
                            weather = "MODERATE SNOW"
                            self._weatherImage.image = UIImage(named:"Snow")
                            
                            
                        }
                            
                        else if (code.isEqual(to: "403")){
                            
                            weather = "HEAVY SNOW"
                            self._weatherImage.image = UIImage(named:"Snow")
                            
                            
                        }
                            
                        else if (code.isEqual(to: "404")){
                            
                            weather = "SLEET"
                            self._weatherImage.image = UIImage(named:"Snow")
                            
                            
                        }
                            
                        else if (code.isEqual(to: "501")){
                            
                            weather = "FOGGY"
                            self._weatherImage.image = UIImage(named:"miss")
                            
                            
                        }
                            
                        else if (code.isEqual(to: "502")){
                            
                            weather = "HAZE"
                            self._weatherImage.image = UIImage(named:"Haze")
                            
                            
                        }
                            
                        else {
                            
                            weather = "PARTLY CLEAR"
                            self._weatherImage.image = UIImage(named:"Sun")
                            
                            
                        }
                        
                        
                        
                        let attriString1:NSMutableAttributedString = NSMutableAttributedString.init(string: NSString(format: "\(weather!)" as NSString).uppercased(with: Locale.current) as String, attributes: [NSForegroundColorAttributeName:UIColor.black
                            ,NSFontAttributeName:UIFont(name: "AppleSDGothicNeo-Bold", size: 18)!,NSKernAttributeName:3])
                        self._currentWeather.attributedText = attriString1
                        print("----------------------------")
                        print(self._weatherInfo._currenttemp)
                        print("----------------------------")
                        self._weather.text = NSString(format: "\(self._weatherInfo._currenttemp!)º" as NSString) as String

                        
                        let attriString:NSMutableAttributedString = NSMutableAttributedString.init(string: NSString(format: "\(self._weatherInfo._cityName!). \(self._weatherInfo._countryName!)" as NSString).uppercased(with: Locale.current) as String, attributes: [NSForegroundColorAttributeName:UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
                            ,NSFontAttributeName:UIFont(name: "Avenir-Heavy", size: 12)!,NSKernAttributeName:2])
                        self._place.attributedText = attriString
                      
                        if ( AppStatus.shareInstance()._hourBezierpath != nil){
                            
                           AppStatus.shareInstance()._hourBezierpath.removeFromSuperview()
                        }
                        
                        if (self._weatherView != nil){
                            
                            self._weatherView.removeFromSuperview()
                        }

                        
                        
                        if (AppStatus.shareInstance()._weatherToall.count >= 5){
                        
                        self._weatherView = WeekWeatherView.init(frame: CGRect(x: 0, y: self._weather.frame.maxY+120, width: self.view.frame.width, height: 80))
                        self.view.addSubview(self._weatherView)
                        
                        }
                        
                        AppStatus.shareInstance()._hourBezierpath = HourBezierPath.init(frame: CGRect(x: 0, y: self.view.frame.height/10, width: self.view.frame.width, height: 200))
                        AppStatus.shareInstance()._hourBezierpath.backgroundColor = UIColor.white

                        self.view.addSubview(AppStatus.shareInstance()._hourBezierpath)
                          AppStatus.shareInstance()._hourBezierpath.draw(CGRect(x: 0, y: self.view.frame.height/10, width: self.view.frame.width, height: 200))
                        
                        if (self._isChange == false){
                            
                              AppStatus.shareInstance()._hourBezierpath.alpha = 0
                        }
                        
                       else if (self._isChange == true){
                            
                            AppStatus.shareInstance()._hourBezierpath.alpha = 1
                        }

                        
                         self._pathBtn.isUserInteractionEnabled = true
                        
                    })

                    
                    let userDefault:UserDefaults = UserDefaults.init(suiteName: "group.Open")!
                    userDefault.set(self._weatherInfo._currenttemp, forKey: "NowWeather")                    
                    let arr:NSArray = NSArray(array:AppStatus.shareInstance()._data)
                    userDefault.set(arr, forKey: "Hourly")
                    
                    userDefault.synchronize()
                   
                    

                
                    
                    
                } catch let error{
                    print("got an error creating the request: \(error)")
                }
                
                //do things...
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
        
        
    }
    func getInfoWithlocation(_ location:CLLocation){
    

        let str = "f32b38c403b025579c1883a2c668603e"
        let str1 = NSString(format: "http://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&APPID=\(str)" as NSString)
        
        do {
            let opt = try HTTP.POST(str1 as String, parameters: nil)
            opt.start { response in
                
                do{
                    self._dic = NSDictionary()
                    try self._dic = JSONSerialization.jsonObject(with: (response.data), options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                   //print(self._dic)
                    self._weatherInfo._countryName = (self._dic["sys"]as! NSDictionary)["country"] as! NSString
                    self._weatherInfo._cityName = self._dic["name"] as! NSString
                   
                    self.getForecastInfoWithlocation(location)

                
                    
                            } catch let error{
                    print("got an error creating the request: \(error)")
                }
                
                //do things...
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
        
        
        

    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

