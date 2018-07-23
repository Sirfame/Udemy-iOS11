//
//  ViewController.swift
//  Bach to Bach
//
//  Created by Sirfame Lin on 7/21/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let audioPath = Bundle.main.path(forResource: "bach", ofType:"mp3");
    var player = AVAudioPlayer()
    var timer = Timer()

    @IBAction func play(_ sender: Any) {
        player.prepareToPlay()
        
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
            }
    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate();
    }
    @IBAction func stop(_ sender: Any) {
        player.pause()
        timer.invalidate();
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            time.maximumValue = Float(player.duration)
        } catch {
            
        }
        time.value = 0;
    }
    @IBAction func volume(_ sender: Any) {
        player.volume = volumeValue.value;
    }
    @IBOutlet var volumeValue: UISlider!
    @IBAction func changeTime(_ sender: Any) {
        player.currentTime = TimeInterval(time.value)
    }
    @objc func updateTime(_ timer: Timer) {
        time.value = Float(player.currentTime)
    }
    @IBOutlet var time: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            time.maximumValue = Float(player.duration)
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

