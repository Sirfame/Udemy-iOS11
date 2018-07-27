//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Sirfame Lin on 7/27/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("sf2", forKey: "username")
        newUser.setValue("pass", forKey: "password")
        newUser.setValue(24, forKey: "age")
        do {
            try context.save()
            print("saved")
        } catch {
            print("there was an error")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users") // sort of like an array
        
        request.returnsObjectsAsFaults = false; // instead of returning the actual values from the db, it wil return faults. userful when testing the strucutre of the db, but not the results themselves.
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] { // we need to cast the results object as an array of NSManagedObject results will have a type of NSFetchRequestResult which will always be castable to NSManagedObject which means that we can safetly force cast.
                    if let username = result.value(forKey: "username") as? String {
                        print(username)
                    }
                }
            } else {
                print("no results")
            }
        } catch {
            print("no results")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

