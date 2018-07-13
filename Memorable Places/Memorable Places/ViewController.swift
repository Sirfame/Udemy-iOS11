//
//  ViewController.swift
//  Memorable Places
//
//  Created by Sirfame Lin on 7/10/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToTableSegue" {
            let MapViewController = segue.destination as! RootViewController;
            print("To root view controller");
        }
    }
    
    @objc func longPress(gestureRecognizer: UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate;
        annotation.title = "New Place"
        annotation.subtitle = "Maybe I will go there"
        map.addAnnotation(annotation)
        let pinLocation: CLLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude);

        if(gestureRecognizer.state == UIGestureRecognizerState.ended) {
            let decoded  = UserDefaults.standard.object(forKey: "Places") as! Data
            if var places = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [CLLocation] {

                places.append(pinLocation)
                let encodedData = NSKeyedArchiver.archivedData(withRootObject: places)
                UserDefaults.standard.set(encodedData, forKey: "Places")


                
                
                print("perm storage accessed from longPress: current count - \(places.count)")

                for place in places {
                    print(place)
                }
            }
            
//            CLGeocoder().reverseGeocodeLocation(pinLocation) { (placemarks, error) in
//                if error != nil {
//                    print(error!)
//                } else {
//                    if let placemark = placemarks?[0] {
//                        var subAdministrativeArea = "";
//                        if placemark.subAdministrativeArea != nil {
//                            subAdministrativeArea = placemark.subAdministrativeArea!;
//                            print(subAdministrativeArea)
//                            if var places = UserDefaults.standard.object(forKey: "Places") as? [String] {
//                                places.append(subAdministrativeArea)
//                                print("perm storage accessed from longPress: current count - \(places.count)")
//                                UserDefaults.standard.set(places, forKey: "Places")
//                                for place in places {
//                                    print(place)
//                                }
//                            }
//
//                        }
//                    }
//                }
//            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let uilpr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecognizer:)))
        uilpr.minimumPressDuration = 2;
        map.addGestureRecognizer(uilpr)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

