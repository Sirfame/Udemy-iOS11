//
//  ViewController.swift
//  Menu Bars
//
//  Created by Sirfame Lin on 3/27/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer();
    var currTime = 210;
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBAction func MinusTenSeconds(_ sender: Any) {
        if(currTime > 10) {
            currTime -= 10;
            TimerLabel.text = String(currTime);
        }
    }
    
    @IBAction func PlusTenSeconds(_ sender: Any) {
        currTime += 10;
        TimerLabel.text = String(currTime);
    }
    
    @IBAction func ResetTimer(_ sender: Any) {
        currTime = 210;
        TimerLabel.text = String(currTime);
    }
    
    @IBAction func TimerPlay(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func TimerPause(_ sender: Any) {
        timer.invalidate();
    }
    
    @objc func processTimer() {
        currTime -= 1;
        if(currTime > 0) {
            TimerLabel.text = String(currTime);
        } else {
            TimerLabel.text = "Egg is done";
            timer.invalidate();
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TimerLabel.text = String(currTime);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

