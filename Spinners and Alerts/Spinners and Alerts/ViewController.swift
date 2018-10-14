//
//  ViewController.swift
//  Spinners and Alerts
//
//  Created by Sirfame Lin on 10/13/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Hey there!", message: "Are you sure?", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
            print("OK button pressed")
            self.dismiss(animated: true, completion: nil)
        }))
        
        alertController.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
            print("No button pressed")
            
            self.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    @IBAction func pauseApp(_ sender: Any) {
        
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        activityIndicator.center = self.view.center;
        
        activityIndicator.hidesWhenStopped = true;
        
        activityIndicator.style = UIActivityIndicatorView.Style.gray;
        
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating();
        
        UIApplication.shared.beginIgnoringInteractionEvents(); // this actually pauses the interaction between the app and the user.
        
        UIApplication.shared.endIgnoringInteractionEvents();
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

