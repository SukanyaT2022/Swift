//
//  ViewController.swift
//  june25-swiftLocation
//
//  Created by Tiparpron Sukanya on 6/25/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCurrentLocation()
    }
    //let logetitudw and latitude
    func getCurrentLocation(){
        let locationManager = CLLocationManager()
        let status = locationManager.authorizationStatus
        
        if status == .notDetermined{
            locationManager.requestAlwaysAuthorization()
            }
        locationManager.delegate = self
        locationManager.requestLocation()
        
        }
        
    }
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        print(locations)
        print("Longlitude:\(locations.first?.coordinate.longitude)")
        print("Latitude:\(locations.first?.coordinate.latitude)")
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

}




