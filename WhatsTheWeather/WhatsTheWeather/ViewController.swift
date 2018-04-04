//
//  ViewController.swift
//  WhatsTheWeather
//
//  Created by Sirfame Lin on 4/2/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userInput: UITextField!
    @IBOutlet var display: UILabel!
    @IBAction func submit(_ sender: Any) {
        
        if let input = userInput.text {
            var city = input;
            if input.contains(" ") {
                city = input.replacingOccurrences(of: " ", with: "-");
            }
            let rawUrl = "https://www.weather-forecast.com/locations/" + city + "/forecasts/latest.com"
            if let url = URL(string: rawUrl) {
                let request = NSMutableURLRequest(url: url);
                let task = URLSession.shared.dataTask(with: request as URLRequest) {
                    data, response, error in
                    
                    if let error = error {
                        print(error)
                    } else {
                        if let unwrappedData = data {
                            if let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) {
                                //print(dataString);
                                if dataString.contains("Weather-Forecast.com - global weather source.") {
                                    DispatchQueue.main.sync(execute: {
                                        // Update UI
                                        self.display.text = "\(input) was not found, sorry."
                                    });
                                } else if dataString.contains("(1&ndash;3 days)</span><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">") {
                                    var arr = dataString.components(separatedBy: "(1&ndash;3 days)</span><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">");
                                    let temp = NSString(string: "\(arr[1])");
                                    var arr2 = temp.components(separatedBy: "</span>");
                                    let weather = NSString(string: "\(arr2[0])");
                                    let displayString = NSString(string: weather).replacingOccurrences(of: "&deg;", with: "°");
                                    //print(displayString);
                                    
                                    DispatchQueue.main.sync(execute: {
                                        // Update UI
                                        self.display.text = displayString;
                                    });
                                }
                            }
                        }
                    }
                }
                task.resume();
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}

