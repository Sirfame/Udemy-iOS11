//
//  ViewController.swift
//  Advanced Segues
//
//  Created by Sirfame Lin on 7/9/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
let sirfame = "Srfame"
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var activeRow = 0;

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // id row that was tapped
        activeRow = indexPath.row
        performSegue(withIdentifier: "toSecondViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondViewController" {
            let secondViewController = segue.destination as! SecondViewController
            
            secondViewController.sf = "sirfame lin"
            secondViewController.activeRow = activeRow;
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

