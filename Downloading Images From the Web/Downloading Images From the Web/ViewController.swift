//
//  ViewController.swift
//  Downloading Images From the Web
//
//  Created by Sirfame Lin on 8/3/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bachImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) // tilde is ~
        if documentPath.count > 0 {
            let documentDirectory = documentPath[0]
            let restorePath = documentDirectory + "/bach.jpg"
            bachImageView.image = UIImage(contentsOfFile: restorePath)
        }
        
//        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/6/6a/Johann_Sebastian_Bach.jpg")!
//        let request = NSMutableURLRequest(url: url)
//
//        let task = URLSession.shared.dataTask(with: request as URLRequest) {
//            data, response, error in
//            if error != nil {
//                print(error)
//            } else {
//                if let data = data { // this will unwrap data as long it has a value (since it is an optional and we want to avoid force unwrap.
//                    if let bachImage = UIImage(data: data) {
//                        DispatchQueue.main.async {
//                            self.bachImageView.image = bachImage // need self. since we are in a closure and want to reference the variable outside.
//                            let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) // tilde is ~
//                            if documentPath.count > 0 {
//                                let documentDirectory = documentPath[0]
//                                let savePath = documentDirectory + "/bach.jpg"
//                                do {
//                                    try UIImageJPEGRepresentation(bachImage, 1)?.write(to: URL(fileURLWithPath: savePath))
//                                } catch {
//                                    // process error
//                                }
//                            }
//
//                        }
//
//                    }
//                }
//
//            }
//        }
//
//        task.resume();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

