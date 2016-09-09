//
//  MapController.swift
//  Shell-Revelry
//
//  Created by John Montejano on 9/9/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import UIKit
import MapKit
import  CoreLocation

class MapController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        locationManager.requestAlwaysAuthorization()
        self.mapView.showsUserLocation = true

       
        func pin(){
        let initialLocation = CLLocation(latitude: 37.7884138, longitude: -122.4378458)
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                      regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
            centerMapOnLocation(initialLocation)
            

        }
        
    }
        
        

    }

    
}
