//
//  FirstViewController.swift
//  To Do List
//
//  Created by Sirfame Lin on 3/30/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ToDoList = UserDefaults.standard.object(forKey: "ToDoList") as? Array<String>
    
    @IBOutlet weak var table: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(ToDoList?.count);
        if ToDoList != nil {
            return ToDoList!.count;
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell");
        if let task = ToDoList![indexPath.row] as? String  {
            cell.textLabel?.text = task;
        }
        return cell;
    }
    
    override func viewDidAppear(_ animated: Bool) {
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

