//
//  ViewController.swift
//  Permanent Data Storage
//
//  Created by Sirfame Lin on 3/30/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //UserDefaults.standard.set("Sirfame", forKey: "name");
        let nameObject = UserDefaults.standard.object(forKey: "name")
        if let name = nameObject as? String {
            print(name)
        }
        
        let arr = [1, 2, 3, 4]
        UserDefaults.standard.set(arr, forKey: "array")
        
        let arrayObject = UserDefaults.standard.object(forKey: "array");
        
        if let array = arrayObject as? NSArray {
            print(array)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

