//
//  ViewController.swift
//  Maps
//
//  Created by Sirfame Lin on 6/25/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let latitude: CLLocationDegrees = 25.034
        let longitude: CLLocationDegrees = 121.5645
        
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        
        let annotation = MKPointAnnotation();
        
        annotation.title = "Taipei 101"
        
        annotation.subtitle = "Been here done that"
        
        annotation.coordinate = location
        
        map.addAnnotation(annotation)
        
        // General purpose for long press
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecognizer:)))
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
    }
    
    // here the colon becomes important. If we did not have the colon, the method would still be called, but no information would be sent along with it. The colon allows data of where the press occurred on the screen to be sent to the function below as the gestureRecongizer parameter.
    @objc func longPress(gestureRecognizer: UIGestureRecognizer) {
        //self.map because we are in an enclosure and not in the viewDidLoad
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New place"
        annotation.subtitle = "Maybe I'll go here too"
        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

