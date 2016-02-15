//
//  Location.swift
//  barr
//
//  Created by Justin Hilliard on 2/11/16.
//  Copyright © 2016 barrapp. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    var latitude: Double?
    var longitude: Double?
    
    let locationManager = CLLocationManager()
    
    init(){
        self.latitude = 37.773
        self.longitude = -122.431

    }
    
    func findCurrLocation(completion: (Double, Double) -> Void){
        
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        print("hit \(CLLocationManager.locationServicesEnabled())")
        if( CLLocationManager.locationServicesEnabled() ){
            print(locationManager)
            let currLocation = locationManager.location
            self.latitude = currLocation!.coordinate.latitude
            self.longitude = currLocation!.coordinate.longitude
            completion(self.latitude!, self.longitude!)
        } else {
            print("hit")
            locationManager.requestWhenInUseAuthorization()
            let currLocation = locationManager.location
            self.latitude = currLocation!.coordinate.latitude
            self.longitude = currLocation!.coordinate.longitude
            completion(self.latitude!, self.longitude!)
        }
    }
    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        var locValue:CLLocationCoordinate2D = manager.location.coordinate
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//    }
    
}
