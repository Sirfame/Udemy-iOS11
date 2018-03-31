//
//  ViewController.swift
//  PermaNumber
//
//  Created by Sirfame Lin on 3/30/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var displayNumber: UILabel!
    
    @IBAction func SaveNumber(_ sender: Any) {
        if let number = userInput.text {
            UserDefaults.standard.set(number, forKey: "number")
            displayNumber.text = number;
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let savedNumber = UserDefaults.standard.value(forKey: "number")
        if let number = savedNumber as? String {
            displayNumber.text = number;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

