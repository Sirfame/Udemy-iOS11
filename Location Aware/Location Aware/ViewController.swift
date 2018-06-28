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

    
    @IBOutlet var subThoroughFareAndThoroughFareLabel: UILabel!
    @IBOutlet var subLocalityLabel: UILabel!
    @IBOutlet var subAdministrivtiveAreaAndPostalCodeLabel: UILabel!
    
    @IBOutlet var countryLabel: UILabel!
    
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
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print(error)
            } else {
                if let placemark = placemarks?[0] {
                    var subThoroughfare = ""
                    if placemark.subThoroughfare != nil {
                        // unwrapping placemark.subThoroughfare because we are already checking if it is nil.
                        // not using let setup because we want subThoroughfare to exist either way since we are combining in single string later on.
                        subThoroughfare = placemark.subThoroughfare!;
                    }
                    
                    var thoroughfare = ""
                    if placemark.thoroughfare != nil {
                        thoroughfare = placemark.thoroughfare!;
                    }
                    
                    var subLocality = ""
                    if placemark.subLocality != nil {
                        subLocality = placemark.subLocality!;
                    }
                    
                    var subAdministritiveArea = ""
                    if placemark.subAdministrativeArea != nil {
                        subAdministritiveArea = placemark.subAdministrativeArea!;
                    }
                    
                    var postalCode = ""
                    if placemark.postalCode != nil {
                        postalCode = placemark.postalCode!;
                    }
                    
                    var country = ""
                    if placemark.country != nil {
                        country = placemark.country!;
                    }
                    
                    self.subAdministrivtiveAreaAndPostalCodeLabel.text = subThoroughfare + thoroughfare;
                    
                    self.subLocalityLabel.text = subLocality;
                    
                    self.subAdministrivtiveAreaAndPostalCodeLabel.text = subAdministritiveArea + " " + postalCode;
                    
                    self.countryLabel.text = country;
                    
                    print(subThoroughfare + thoroughfare + "\n" + subLocality + "\n" + subAdministritiveArea + ", " + postalCode + "\n" + country)
                }
            }
        }
        
    }


}

