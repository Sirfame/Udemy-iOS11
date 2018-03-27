//
//  ViewController.swift
//  Is It Prime
//
//  Created by Sirfame Lin on 3/26/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBAction func checkPrime(_ sender: Any) {
        if let stringNumber = input.text {
            if let intNumber = Int(stringNumber) {
                if isPrime(n: intNumber) {
                    answerLabel.text = "\(intNumber) is a prime number";
                } else {
                    answerLabel.text = "\(intNumber) is not a prime number"
                }
            } else {
                answerLabel.text = "Please enter a positive whole number"
            }
        }
    }
    
    func isPrime(n : Int) -> Bool {
        if n < 2 {
            return false;
        }
        var divisor = 2;
        while divisor <= n / 2 {
            if n % divisor == 0 {
                return false;
            }
            divisor += 1;
        }
        return true;
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

