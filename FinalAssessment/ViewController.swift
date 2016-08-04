//
//  ViewController.swift
//  FinalAssessment
//
//  Created by 蔡舜珵 on 2016/8/4.
//  Copyright © 2016年 蔡舜珵. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FinalAssessment 3.1
        let urlString: String = "https://httpbin.org/get"
        Alamofire.request(.GET, urlString).responseJSON { response in
            if let data = response.result.value{
                let json = JSON(data)
                json["origin"].stringValue
                NSLog(json["origin"].stringValue)
            }
        }
        //FinalAssessment 3.2
        
        //http://stackoverflow.com/questions/2129794/how-to-log-a-methods-execution-time-exactly-in-milliseconds#comment22972089_2129884
        let urlString2: String = "https://httpbin.org/post"
        let started = NSDate()
        Alamofire.request(.POST, urlString2,parameters: ["time":"\(started)"]).responseJSON { response in
            let finished = NSDate()
            let interval = finished.timeIntervalSinceDate(started)
            print(interval)
            NSLog("花了\(interval)秒")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

