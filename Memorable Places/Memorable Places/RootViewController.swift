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
        if segue.identifier == "ToSavedLocationSegue" {
            let MapViewController = segue.destination as! ViewController;
            //MapViewController.map.centerCoordinate.latitude
            MapViewController.latitude = latitude
            MapViewController.longitude = longitude
            MapViewController.pinTitle = pinTitle;
            print("To map view controller \(latitude) \(longitude) \(pinTitle)");
        }
    }
    
    var pinTitle:String!
    var latitude:CLLocationDegrees!;
    var longitude:CLLocationDegrees!;
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        latitude = places[indexPath.row].coordinate.latitude;
        longitude = places[indexPath.row].coordinate.longitude;
        pinTitle = currentCell.textLabel?.text
        performSegue(withIdentifier: "ToSavedLocationSegue", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let decoded  = UserDefaults.standard.object(forKey: "Places") as! Data
        places = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [CLLocation]
        if let storedPlaces = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [CLLocation] {
            places = storedPlaces
        }
        table.reloadData();
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            places.remove(at: indexPath.row);
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: places)
            UserDefaults.standard.set(encodedData, forKey: "Places")
            table.reloadData();
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAt indexPath: NSIndexPath) {
        print(indexPath.row)
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let decoded  = UserDefaults.standard.object(forKey: "Places") as! Data
        places = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [CLLocation]
        if let storedPlaces = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [CLLocation] {
            places = storedPlaces
        }
        print("From tableview: Count - \(places.count)" )
        return places.count;
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let decoded  = UserDefaults.standard.object(forKey: "Places") as! Data
        places = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [CLLocation]
        if let storedPlaces = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [CLLocation] {
            places = storedPlaces
        }
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
        let decoded  = UserDefaults.standard.object(forKey: "Places") as! Data
        places = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [CLLocation]
        if let storedPlaces = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [CLLocation] {
            places = storedPlaces
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
