//
//  ViewController.swift
//  API Demo
//
//  Created by Sirfame Lin on 8/7/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBAction func submit(_ sender: Any) {
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=" + textField.text!.replacingOccurrences(of: " ", with: "%20") + "&appid=b4e281908a07641483fda6c5ccc75a5d") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                } else {
                    if let urlContent = data {
                        do {
                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                            print(jsonResult)
                            if let dictionary = jsonResult as? [String: Any] {
                                if let name = dictionary["name"] as? String {
                                    print(name)
                                }
                                if let description = ((dictionary["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                    print(description)
                                    DispatchQueue.main.sync(execute: {
                                        self.weatherDescription.text = description
                                    });
                                }
                                
                                
                                for (key, value) in dictionary {
                                    // access all key / value pairs in dictionary
                                }
                                
                                if let nestedDictionary = dictionary["anotherKey"] as? [String: Any] {
                                    // access nested dictionary values by key
                                }
                            }
                        } catch {
                            print("JSON Processing failed ")
                        }
                        
                    }
                }
            }
            task.resume();
        } else {
            weatherDescription.text = "Could not find weather for input city"
        }
        
        
    }
    @IBOutlet var weatherDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

