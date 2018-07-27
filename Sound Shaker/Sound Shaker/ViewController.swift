//
//  ViewController.swift
//  Sound Shaker
//
//  Created by Sirfame Lin on 7/24/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            playRandom()
        }
    }
    
    func playRandom() {
        let audioArray = ["arrow", "autohandgun", "radio", "revolver", "rifle", "shotgun", "shotgunshot", "whip"]
        let number = arc4random_uniform(UInt32(audioArray.count))
        let audioPath = Bundle.main.path(forResource: audioArray[Int(number)], ofType: "mp3")
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            player.play()
        } catch {
            
        }
        
        print(number)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

