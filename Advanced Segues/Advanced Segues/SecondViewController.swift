//
//  SecondViewController.swift
//  Advanced Segues
//
//  Created by Sirfame Lin on 7/9/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var sf = "sf"
    var activeRow = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        print(sf)
        print(activeRow)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
