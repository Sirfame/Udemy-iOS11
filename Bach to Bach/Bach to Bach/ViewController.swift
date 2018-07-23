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
    
    var player = AVAudioPlayer()

    @IBAction func play(_ sender: Any) {
        player.prepareToPlay()
        
        player.play()
        
    }
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    @IBAction func volume(_ sender: Any) {
        player.volume = volumeValue.value;
    }
    @IBOutlet var volumeValue: UISlider!
    @IBAction func changeTime(_ sender: Any) {
        player.currentTime = TimeInterval(time.value)
    }
    func updateTime(_ timer: Timer) {
        time.value = Float(player.currentTime)
    }
    @IBOutlet var time: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let audioPath = Bundle.main.path(forResource: "bach", ofType:"mp3");
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            time.maximumValue = Float(player.duration)
            time.value = 0.0
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeTime), userInfo: nil, repeats: true)
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

