//
//  ViewController.swift
//  CatYears
//
//  Created by Sirfame Lin on 3/25/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Age: UITextField!
    @IBOutlet weak var CatAge: UILabel!
    @IBAction func GetCatYears(_ sender: Any) {
        if let age = Age.text {
            if let ageAsNumber = Int(age) {
                let catAge = ageAsNumber * 7;
                CatAge.text = "Your cat is " + String(catAge) + " years old";
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


}

