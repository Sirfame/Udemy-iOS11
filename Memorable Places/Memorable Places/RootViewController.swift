//
//  RootViewController.swift
//  Memorable Places
//
//  Created by Sirfame Lin on 7/11/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    
    var places: [String] = [];

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places = UserDefaults.standard.object(forKey: "Places") as! [String];
        print("From tableview: Count - \(places.count)" )
        return places.count;
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        places = UserDefaults.standard.object(forKey: "Places") as! [String];
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(places[indexPath.row])"
        return cell;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("test")
        // Do any additional setup after loading the view.
        let test = UserDefaults.standard.object(forKey: "temp");
        
        let places = UserDefaults.standard.object(forKey: "Places");
        if let word = test as? String {
            print(word)
        }
        var empty: [String] = [];

        if let placesArr = places as? [String] {
            for place in placesArr {
                print(place)
            }
        } else {
            print("Places key not found")
        }
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
