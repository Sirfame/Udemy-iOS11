//
//  ViewController.swift
//  Table Views
//
//  Created by Sirfame Lin on 3/28/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellContent = ["Sunny", "Nhi", "Schawnery", "Victoria"];
    
    // This method asks for how many rows are there in the section, and we want to return the number. (If we return 1, we are saying that there is one row in our table)
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count;
    }
    
    // This method asks for the index of each cell, defines the cell, and adds content to it.
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell");
        
        // Put question mark here to indiciate that we know that it is an optional and it is possible for this label to not exist.
        cell.textLabel?.text = cellContent[indexPath.row];
        
        return cell;
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

