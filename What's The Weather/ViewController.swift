//
//  ViewController.swift
//  What's The Weather
//
//  Created by Matthew Jenks on 9/24/14.
//  Copyright (c) 2014 FiveWest. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var message: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject)
    {
        
        self.view.endEditing(true)
        
        var urlString = "http://www.weather-forecast.com/locations/" + city.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
        
        var url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {(data, response, error) in
            
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            
            
            if (urlContent as NSString).containsString("<span class=\"phrase\">") {
            
            
            
            var contentArray = urlContent.componentsSeparatedByString("<span class=\"phrase\">")
        
            
            var newContentArray = contentArray[1].componentsSeparatedByString("</span>")
            
            self.message.text = newContentArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º") as String
            
            } else {
            
            self.message.text = "Counln't find that city - please try again"
            
            }
            
        
    }
        task.resume()
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        
    }

      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


