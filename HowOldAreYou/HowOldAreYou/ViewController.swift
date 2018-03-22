//
//  ViewController.swift
//  HowOldAreYou
//
//  Created by Sirfame Lin on 3/22/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBAction func ageButton(_ sender: Any) {
        if let age = ageTextField.text {
            ageLabel.text = "You are " + age + " years old";
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

