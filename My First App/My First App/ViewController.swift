//
//  ViewController.swift
//  My First App
//
//  Created by Sirfame Lin on 1/22/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // var means creating a variable, in this case called var, and has Type of UILabel
    // The exclaimation mark at the end of the type UILabel means that the label HAS to exist.
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var NameTextField: UITextField!
    
    // IB stands for interface builder, and Action refers to when the button is clicked
    @IBAction func ButtonClicked(_ sender: Any) {
        print("Button clicked");
        
        if let name = NameTextField.text {
            label.text = "Hello " + name;
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
