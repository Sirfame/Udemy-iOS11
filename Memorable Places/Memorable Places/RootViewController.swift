//
//  RootViewController.swift
//  Memorable Places
//
//  Created by Sirfame Lin on 7/11/18.
//  Copyright © 2018 Sirfame Lin. All rights reserved.
//

import UIKit
import MapKit

class RootViewController: UITableViewController, MKMapViewDelegate {
    
    var places: [CLLocation] = [];
    @IBOutlet weak var table: UITableView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToMapSegue" {
            let MapViewController = segue.destination as! ViewController;
            print("To map view controller");
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // First attempt
        /*
         print("Table view appeared")
         ToDoList = UserDefaults.standard.object(forKey: "ToDoList") as? Array<String>
         table.reloadData();
         */
        
        // Second attempt
        let StoredPlaces = UserDefaults.standard.object(forKey: "Places");
        if let placeArray = StoredPlaces as? [CLLocation] {
            places = StoredPlaces as! [CLLocation];
        }
        table.reloadData();
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let decoded  = UserDefaults.standard.object(forKey: "Places") as! Data
        places = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [CLLocation]

        print("From tableview: Count - \(places.count)" )
        return places.count;
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let decoded  = UserDefaults.standard.object(forKey: "Places") as! Data
        places = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [CLLocation]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        var subAdministrativeArea = "";
        CLGeocoder().reverseGeocodeLocation(places[indexPath.row]) { (placemarks, error) in
            if error != nil {
                print(error!)
            } else {
                if let placemark = placemarks?[0] {
                    
                    if placemark.subAdministrativeArea != nil {
                        subAdministrativeArea = placemark.subAdministrativeArea!;
                        cell.textLabel?.text = "\(subAdministrativeArea)"
                    } else {
                        cell.textLabel?.text = "Location temporarily unavailable"
                    }
                }
            }
        }
        
        
        return cell;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let emptyArray:[CLLocation] = [];
//        UserDefaults.standard.set(emptyArray, forKey: "Places");
//
//        let places = UserDefaults.standard.object(forKey: "Places");

        var empty: [String] = [];

        if let placesArr = places as? [CLLocation] {
            for place in placesArr {
                print(place.coordinate.latitude)
            }
        } else {
            print("Places key not found")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
