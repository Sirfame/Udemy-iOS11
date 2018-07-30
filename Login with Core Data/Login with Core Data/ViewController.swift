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
            usernameField.alpha = 0;
            
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
                        usernameField.alpha = 0;
                        
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

