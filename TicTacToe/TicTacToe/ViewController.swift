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
    
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject) {
        activeGame = true;
        activePlayer = 1;
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0];
        
        for i in 1..<10 {
            
            // This is also where the instructor said that it would be useful when if we set the tag to something specific, it would be more useful to set it all to something non-zero, otherwise we would have to go through all the other views and set the tag to something to non zero
            if let button = view.viewWithTag(i) as? UIButton {
                // the reason why we need to cast is because view will return as a general view, but we want button specific features, which is setImage
                button.setImage(nil, for: [])
            }
        }
        winnerLabel.isHidden = true;
        playAgainButton.isHidden = true;
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y);
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y);
    }
    
    var activeGame = true;
    
    var activePlayer = 1;
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]; // empty, 1 - circles, 2 - crosses.
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]];

    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1;
        
        if(gameState[activePosition] == 0 && activeGame) {
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
                    winnerLabel.text = "Circles have won!";
                    print("circle wins");
                } else {
                    winnerLabel.text = "Crosses have won!";
                    print("cross wins");
                }
                activeGame = false;
                winnerLabel.isHidden = false;
                playAgainButton.isHidden = false;
                print(gameState[combination[0]])
                UIView.animate(withDuration: 1, animations: {
                    self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                })
                
            }
        }

        
        print(sender.tag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.isHidden = true;
        playAgainButton.isHidden = true;
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y);
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

