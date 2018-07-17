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
//        let emptyArray:[CLLocation] = [];
//        UserDefaults.standard.set(emptyArray, forKey: "Places");
//
//        let places = UserDefaults.standard.object(forKey: "Places");

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
