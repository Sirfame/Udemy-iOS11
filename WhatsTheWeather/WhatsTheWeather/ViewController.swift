//
//  ViewController.swift
//  WhatsTheWeather
//
//  Created by Sirfame Lin on 4/2/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let url = URL(string: "https://www.weather-forecast.com/locations/Seattle/forecasts/latest.com") {
            let request = NSMutableURLRequest(url: url);
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if let error = error {
                    print(error)
                } else {
                    if let unwrappedData = data {
                        if let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) {
                            //print(dataString);
                            var arr = dataString.components(separatedBy: "(1&ndash;3 days)</span><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">");
                            let temp = NSString(string: "\(arr[1])");
                            var arr2 = temp.components(separatedBy: "</span>");
                            let weather = NSString(string: "\(arr2[0])");
                            print(NSString(string: weather).replacingOccurrences(of: "&deg;", with: "°"))
                            DispatchQueue.main.sync(execute: {
                                // Update UI
                            });
                        }
                    }
                }
            }
            
            task.resume();
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

