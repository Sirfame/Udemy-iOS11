//
//  ViewController.swift
//  Times Table
//
//  Created by Sirfame Lin on 3/29/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var table: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell");
        
        cell.textLabel?.text = "\(Int(slider.value)) x \(indexPath.row + 1) = \(Int(slider.value) * (indexPath.row + 1))";
        
        return cell;
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        table.reloadData();
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

