//
//  ViewController.swift
//  Instagram
//
//  Created by Sirfame Lin on 10/11/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
        let comment = PFObject(className: "Comment")
        
        comment["text"] = "Nice shot!"
        
        comment.saveInBackground { (success, error) in
            if(success) {
                print("Save successful")
            } else {
                print("Save failed")
            }
        }
        */
        
        let query = PFQuery(className: "Comment")
        query.getObjectInBackground(withId: "Ihz0DTrZGX") { (object, error) in
            if let comment = object {
                if let text = comment["text"] {
                    print(text)
                }
                comment["text"] = "awful shot"
                comment.saveInBackground(block: { (success, error) in
                    if(success) {
                        print("Comment change successful")
                    } else {
                        print("Comment change failed")
                    }
                })
            }
        }
    }


}

