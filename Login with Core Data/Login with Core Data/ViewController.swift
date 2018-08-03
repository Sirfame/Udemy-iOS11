//
//  ViewController.swift
//  Login with Core Data
//
//  Created by Sirfame Lin on 7/30/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var isLoggedIn = false;

    @IBOutlet var logout: UIButton!
    @IBAction func logoutButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users") // sort of like an array
        request.returnsObjectsAsFaults = false; // we dont need this because we dont care what the username is, since we are just going to delete it.
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    context.delete(result)
                    do {
                        try context.save();
                        print("logged out (deleted) successfully")
                        login.setTitle("Login", for: [])
                        logout.alpha = 0;
                        displayUsername.text = "Please login"
                        isLoggedIn = false;
                    } catch {
                        print("logout (delete) failed")
                    }
                }
            } else {
                displayUsername.text = "Please login"
            }
        } catch {
            print("There was an error.")
        }
    }
    @IBOutlet var login: UIButton!
    @IBOutlet var displayUsername: UILabel!
    @IBOutlet var usernameField: UITextField!
    @IBAction func loginButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newUsername = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users") // sort of like an array
        if isLoggedIn {
            do {
                let results = try context.fetch(request)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if var username = result.value(forKey:"username") as? String {
                            result.setValue(usernameField.text, forKey: "username")
                            username = result.value(forKey:"username") as! String
                            do {
                                try context.save();
                                print("username updated successfully")
                                
                                displayUsername.text = "Hello \(username)"
                            } catch {
                                print("update failed")
                            }
                        }
                    }
                } else {
                    displayUsername.text = "Please login"
                }
            } catch {
                print("There was an error.")
            }
        } else {
            newUsername.setValue(usernameField.text, forKey: "username")
            do {
                try context.save()
                print("saved")
                logout.alpha = 1;
                displayUsername.text = "Hello " + usernameField.text!
                login.setTitle("Update username", for: [])
                isLoggedIn = true;
            } catch {
                print("There was an error.")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Users")
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey:"username") as? String {
                        login.setTitle("Update username", for: []) // empty array for default control set.
                        logout.alpha = 1;
                        displayUsername.text = "Hello \(username)"
                        isLoggedIn = true;
                    }
                }
            } else {
                displayUsername.text = "Please login"
            }
        } catch {
            print("error occured")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

