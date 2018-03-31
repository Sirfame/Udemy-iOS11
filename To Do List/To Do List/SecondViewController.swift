//
//  SecondViewController.swift
//  To Do List
//
//  Created by Sirfame Lin on 3/30/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var toDoInput: UITextField!
    
    @IBAction func AddItemButton(_ sender: Any) {
        if let inputText = toDoInput.text {
            if var arr = UserDefaults.standard.object(forKey: "ToDoList") as? Array<String> {
                arr.append(inputText);
                print("Value Added");
                print(arr);
                UserDefaults.standard.set(arr, forKey: "ToDoList")
            }
            toDoInput.text = "";
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if UserDefaults.standard.object(forKey: "ToDoList") == nil {
            let ToDoList = [String]();
            UserDefaults.standard.set(ToDoList, forKey: "ToDoList")
        }
        if let arr = UserDefaults.standard.object(forKey: "ToDoList") as? Array<String> {
            print(arr);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }


}

