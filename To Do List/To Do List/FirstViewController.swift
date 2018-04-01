//
//  FirstViewController.swift
//  To Do List
//
//  Created by Sirfame Lin on 3/30/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Original attempt
    //var ToDoList = UserDefaults.standard.object(forKey: "ToDoList") as? Array<String>
    
    // Second attempt
    var ToDoList : [String] = [];
    @IBOutlet weak var table: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // First attempt
        /*
        if ToDoList != nil {
            return ToDoList!.count;
        }
        return 0;
        */
        
        // Second attempt
        return ToDoList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Original Attempt
        /*
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell");
        if let task = ToDoList![indexPath.row] as? String  {
            cell.textLabel?.text = task;
        }
        return cell;
         */
        
        // Second attempt
        /*
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell");
        var cellLabel = "";
        if let tempLabel = ToDoList[indexPath.row] as? String {
            cellLabel = tempLabel;
        }
        cell.textLabel?.text = cellLabel;
        return cell;
         */
        
        // Third attempt - no longer need to check, we can be sure items will be a string
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell");
        cell.textLabel?.text = ToDoList[indexPath.row];
        return cell;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // First attempt
        /*
        if editingStyle == .delete {
            print("Deleted")
            ToDoList?.remove(at: indexPath.row);
            //self.catNames.remove(at: indexPath.row)
            UserDefaults.standard.set(ToDoList, forKey: "ToDoList")
            self.table.deleteRows(at: [indexPath], with: .automatic)
        }
        */
        
        // Second attempt
        if editingStyle == .delete {
            print("Deleted")
            ToDoList.remove(at: indexPath.row);
            //self.catNames.remove(at: indexPath.row)
            table.reloadData();
            UserDefaults.standard.set(ToDoList, forKey: "ToDoList")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // First attempt
        /*
        print("Table view appeared")
        ToDoList = UserDefaults.standard.object(forKey: "ToDoList") as? Array<String>
        table.reloadData();
         */
        
        // Second attempt
        let itemsObject = UserDefaults.standard.object(forKey: "ToDoList");
        if let tempItems = itemsObject as? [String] {
            ToDoList = tempItems;
        }
        table.reloadData();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //UserDefaults.standard.removeObject(forKey: "ToDoList");
        // Second Attempt
        let itemsObject = UserDefaults.standard.object(forKey: "ToDoList");
        if let tempItems = itemsObject as? [String] {
            ToDoList = tempItems;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

