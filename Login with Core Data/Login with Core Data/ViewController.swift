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
    
    
    @IBOutlet var changeUsername: UIButton!
    @IBAction func changeUsernameButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users") // sort of like an array
        request.returnsObjectsAsFaults = false;
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
    }
    @IBOutlet var logout: UIButton!
    @IBAction func logoutButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users") // sort of like an array
        request.returnsObjectsAsFaults = false;
        
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey:"username") as? String {
                        context.delete(result)
                        do {
                            try context.save();
                            print("logged out (deleted) successfully")
                            login.alpha = 1;
                            logout.alpha = 0;
                            changeUsername.alpha = 0;
                            displayUsername.text = "Please login"
                        } catch {
                            print("logout (delete) failed")
                        }
                        
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
        newUsername.setValue(usernameField.text, forKey: "username")
        do {
            try context.save()
            print("saved")
            login.alpha = 0;
            logout.alpha = 1;
            changeUsername.alpha = 1;
            displayUsername.text = "Hello " + usernameField.text!
        } catch {
            print("There was an error.")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Users")
        
        // uncomment below to clear Core Data
//        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Users"))
//        do {
//            try context.execute(DelAllReqVar)
//        }
//        catch {
//            print(error)
//        }
    
        
        
        request.returnsObjectsAsFaults = false;
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey:"username") as? String {
                        login.alpha = 0;
                        logout.alpha = 1;
                        changeUsername.alpha = 1;
                        displayUsername.text = "Hello \(username)"
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

