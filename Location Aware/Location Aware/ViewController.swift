//
//  ViewController.swift
//  Location Aware
//
//  Created by Sirfame Lin on 6/28/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var locationManager = CLLocationManager()
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var altitudeLabel: UILabel!

    @IBOutlet var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        
        latitudeLabel.text  = "Latitude:    " + String(userLocation.coordinate.latitude);
        longitudeLabel.text = "Longitude:   " + String(userLocation.coordinate.longitude);
        courseLabel.text    = "Course:      " + String(userLocation.course);
        speedLabel.text     = "Speed:       " + String(userLocation.speed);
        altitudeLabel.text  = "Altitude:    " + String(userLocation.altitude);
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print(error as Any)
            } else {
                
                
                if let placemark = placemarks?[0] {
                    
                    var address = "";
                    
                    var subThoroughfare = ""
                    if placemark.subThoroughfare != nil {
                        // unwrapping placemark.subThoroughfare because we are already checking if it is nil.
                        // not using let setup because we want subThoroughfare to exist either way since we are combining in single string later on.
                        subThoroughfare = placemark.subThoroughfare!;
                        address += subThoroughfare;
                    }
                    
                    var thoroughfare = ""
                    if placemark.thoroughfare != nil {
                        thoroughfare = placemark.thoroughfare!;
                        address += " " + thoroughfare;
                    }
                    
                    var subLocality = ""
                    if placemark.subLocality != nil {
                        subLocality = placemark.subLocality!;
                        address += "\n" + subLocality;
                    }
                    
                    var subAdministritiveArea = ""
                    if placemark.subAdministrativeArea != nil {
                        subAdministritiveArea = placemark.subAdministrativeArea!;
                        address += "\n" + subAdministritiveArea;
                    }
                    
                    var postalCode = ""
                    if placemark.postalCode != nil {
                        postalCode = placemark.postalCode!;
                        address += " " + postalCode;
                    }
                    
                    var country = ""
                    if placemark.country != nil {
                        country = placemark.country!;
                        address += "\n" + country;
                    }
                    
                    self.addressLabel.text = address
                    print("***" + address)
                    //print(subThoroughfare + thoroughfare + "\n" + subLocality + "\n" + subAdministritiveArea + ", " + postalCode + "\n" + country)
                }
            }
        }
        
    }


}

