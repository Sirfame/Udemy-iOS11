//
//  ViewController.swift
//  Instagram
//
//  Created by Sirfame Lin on 10/11/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var gameScore = PFObject(className:"GameScore")
        gameScore["score"] = 1337
        gameScore["playerName"] = "Sean Plott"
        gameScore["cheatMode"] = false
        gameScore.saveInBackground {(success, error) in
            if(success) {
                print("success")
            } else {
                print("failed")
            }
        }
    }


}

