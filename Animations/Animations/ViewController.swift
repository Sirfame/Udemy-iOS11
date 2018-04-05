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
    
    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0;
        // gradually done in the background, not done inline with everything else.
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1;
        });
    }
    
    @IBAction func slideIn(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y);
        // closure = async func? CG stands for core graphics
        UIView.animate(withDuration: 2, animations: {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        });
    }
    
    @IBAction func grow(_ sender: Any) {
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        // Why is it not in the very top left? Because we set the image to aspect fit, so the
        // frame is in the very top left, but the image does not necessarily appear there.
        UIView.animate(withDuration: 1, animations: {
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200);
        });
    }
    
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
            buttonText.setTitle("Start", for: []);
            isAnimating = false;
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            buttonText.setTitle("Stop", for: []);
            isAnimating = true;
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

