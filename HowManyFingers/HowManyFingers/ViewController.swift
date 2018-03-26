//
//  ViewController.swift
//  HowManyFingers
//
//  Created by Sirfame Lin on 3/25/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var UserGuess: UITextField!
    
    @IBOutlet weak var AnswerLabel: UILabel!
    
    @IBAction func GuessButton(_ sender: Any) {
        let randomNum = arc4random_uniform(6);
        if let userGuess = UserGuess.text {
            if let intUserGuess = Int(userGuess) {
                while intUserGuess != randomNum {
                    if intUserGuess != randomNum {
                        AnswerLabel.text = "Wrong! The correct answer is \(randomNum)"
                    } else {
                        AnswerLabel.text = "Correct!"
                    }
                }
            }
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

