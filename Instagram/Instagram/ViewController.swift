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
    
    var signupModeActive = true;
    let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func pauseApp() {
        
        activityIndicator.center = self.view.center;
        
        activityIndicator.hidesWhenStopped = true;
        
        activityIndicator.style = UIActivityIndicatorView.Style.gray;
        
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating();
        
        UIApplication.shared.beginIgnoringInteractionEvents(); // this actually pauses the interaction between the app and the user.
    }
    
    func resumeApp() {
        activityIndicator.stopAnimating();
        UIApplication.shared.endIgnoringInteractionEvents()
    }

    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBAction func signupOrLogin(_ sender: Any) {
        if email.text == "" || password.text == "" {
            displayAlert(title: "Error in form", message: "Please enter an email and password")
        } else {
            pauseApp()
            if(signupModeActive) {
                var user = PFUser()
                user.username = email.text
                user.password = password.text
                user.email = email.text
                // other fields can be set just like with PFObject
                
                print("Signing Up")
                user.signUpInBackground {
                    (success, error) in
                    self.resumeApp()
                    if let error = error {
                        //let errorString = error.userInfo["error"] as? NSString
                        // Show the errorString somewhere and let the user try again.
                        // inside closure here so we need self.
                        self.displayAlert(title: "Could not sign you up", message: error.localizedDescription)
                        print(error)
                    } else {
                        // Hooray! Let them use the app now.
                        print("Signed up!")
                    }
                }
            } else {
                PFUser.logInWithUsername(inBackground: email.text!, password: password.text!) { (user, error) in
                    self.resumeApp()
                    if user != nil {
                        print("Logged in")
                    } else {
                        var errorText = "Unknown error: please try again"
                        if let error = error {
                            errorText = error.localizedDescription
                        }
                        self.displayAlert(title: "Could not log you in", message: errorText)
                    }
                }
            }
            
        }
    }
    @IBOutlet var signupOrLoginButton: UIButton!
    
    @IBAction func switchLoginMode(_ sender: Any) {
        if(signupModeActive) {
            signupModeActive = false;
            signupOrLoginButton.setTitle("Log In", for: [])
            switchLoginModeButton.setTitle("Sign Up", for:[])
        } else {
            signupModeActive = true;
            signupOrLoginButton.setTitle("Sign Up", for: [])
            switchLoginModeButton.setTitle("Sign In", for:[])
        }
    }
    
    @IBOutlet var switchLoginModeButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }


}

