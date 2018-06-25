//
//  ShowLocationViewController.swift
//  iControlTraffic
//
//  Created by Juan Manuel Santos on 25/06/18.
//  Copyright © 2018 Juan Manuel Santos. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ShowLocationViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        setupMapKit()
    }
}

extension ShowLocationViewController: CLLocationManagerDelegate {
    func setupLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            updateMapView(for: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        NSLog("Location error: \(error.localizedDescription)")
    }
}

extension ShowLocationViewController: MKMapViewDelegate {
    
    func setupMapKit() {
        self.mapView.delegate = self
        self.mapView.mapType = .standard
        self.mapView.isZoomEnabled = true
        self.mapView.showsUserLocation = true
        self.mapView.showsScale = true
        self.mapView.showsCompass = true
        self.mapView.showsPointsOfInterest = true
        self.mapView.showsTraffic = true
        self.mapView.showsBuildings = true
    }
    
    func updateMapView(for location: CLLocation) {
        let delta = 0.005
        self.mapView.setRegion(
            MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpanMake(delta, delta)), animated: true)
    }
}


