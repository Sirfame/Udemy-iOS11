//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sirfame Lin on 4/13/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 is cirlces, 2 is crosses
    var activePlayer = 1;
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]; // empty, 1 - circles, 2 - crosses.
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]];

    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1;
        
        if(gameState[activePosition] == 0) {
            gameState[activePosition] = activePlayer;
            if(activePlayer == 1) {
                sender.setImage(UIImage(named: "nought.png"), for:[]);
                activePlayer = 2;
            } else {
                sender.setImage(UIImage(named: "cross"), for:[]);
                activePlayer = 1;
            }
        }
        
        for combination in winningCombinations {
            if(gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                if(activePlayer == 2) {
                    print("circle wins");
                } else {
                    print("cross wins");
                }
            }
        }

        
        print(sender.tag)
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

