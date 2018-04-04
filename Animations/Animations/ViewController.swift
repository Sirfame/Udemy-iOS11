//
//  ViewController.swift
//  Animations
//
//  Created by Sirfame Lin on 4/4/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    @IBOutlet var buttonText: UIButton!
    var counter = 1;
    var isAnimating = false;
    var timer = Timer();
    
    @objc func animate() {
        image.image = UIImage(named: "frame_\(counter)_delay-0.01s.gif")
        counter += 1;
        if counter == 6 {
            counter = 0;
        }
    }
    
    @IBAction func next(_ sender: Any) {
        
        if isAnimating {
            timer.invalidate();
            buttonText.setTitle("Start", for: .normal);
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            buttonText.setTitle("Stop", for: .normal);
        }
        

        
        //print(buttonText.currentTitle! == "Start")
//        if buttonText.currentTitle! == "Start" {
//            print("Started")
//            start = true;
//
//        } else if buttonText.currentTitle! == "Stop" {
//            print("Stopped")
//            start = false;
//
//        }
//        print("start: \(start)")
//        if start {
//            print("wtf")
//        }

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

