//
//  ViewController.swift
//  Audio Player
//
//  Created by Sirfame Lin on 7/19/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBAction func play(_ sender: Any) {
        player.play();
    }
    @IBAction func pause(_ sender: Any) {
        player.pause();
    }
    @IBAction func sliderMoved(_ sender: Any) {
        player.volume = slider.value;
    }
    @IBOutlet var slider: UISlider!
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = Bundle.main.path(forResource: "bach", ofType: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            player.play();
        } catch {
            // process any errors
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

