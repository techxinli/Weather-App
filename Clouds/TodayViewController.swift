//
//  TodayViewController.swift
//  Clouds
//
//  Created by 李鑫 on 16/1/1.
//  Copyright © 2016年 Miracle Lee. All rights reserved.
//

import UIKit
import NotificationCenter



class TodayViewController: UITableViewController, NCWidgetProviding {
    
    
    
    struct TableViewConstants{
        static let cellIdentifier = "Cell"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppStatus.shareInstance()._houly_tmp = NSArray()
    
       tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        // Do any additional setup after loading the view from its nib.
    }
    
         
    func resetContentSize(){
        self.preferredContentSize = tableView.contentSize
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resetContentSize()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resetContentSize()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:WeatherCell? = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.cellIdentifier) as? WeatherCell
        
        if (cell == nil) {
            
            cell = WeatherCell.init(style: UITableViewCellStyle.default, reuseIdentifier: TableViewConstants.cellIdentifier)
            
            
        }
        
        
        return cell!
        
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
 
    
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.newData)
    }
    
}
