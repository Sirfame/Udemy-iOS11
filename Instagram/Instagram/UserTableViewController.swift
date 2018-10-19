//
//  UserTableViewController.swift
//  Instagram
//
//  Created by Sirfame Lin on 10/17/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
import Parse

class UserTableViewController: UITableViewController {

    @IBAction func logoutUser(_ sender: Any) {
        PFUser.logOut()
        performSegue(withIdentifier: "logoutSegue", sender: self)
    }
    
    var usernames = [""]
    var objectIds = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let query = PFUser.query()
        
        query?.whereKey("username", notEqualTo: PFUser.current()?.username)
        
        query?.findObjectsInBackground(block: { (users, error) in
            if error != nil {
                print(error)
            } else if let users = users {
                self.usernames.removeAll()
                self.objectIds.removeAll()
                for object in users {
                    if let user = object as? PFUser {
                        if let username = user.username {
                            if let objectId = user.objectId {
                                let name = username.split(separator: "@")[0]
                                self.usernames.append(String(name))
                                self.objectIds.append(objectId)
                            }
                        }
                    }
                }
                self.tableView.reloadData()
            }
        })
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usernames.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = usernames[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
        
        let following = PFObject(className: "Following")
        
        following["follower"] = PFUser.current()?.objectId
        
        following["following"] = objectIds[indexPath.row]
        
        following.saveInBackground()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}