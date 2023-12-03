//
//  LocationViewModel.swift
//  Weather
//
//  Created by Andrei Isayenka on 29/11/2023.
//

import Foundation
import CoreLocation

protocol LocationViewModelProtocol {
    func startUpdatingLocation()
    func requestLocationAuthorization()
}

final class LocationViewModel: NSObject, LocationViewModelProtocol {
    
    private let locationManager = CLLocationManager()
    public var locationUpdateCallback: ((CLLocation) -> Void)?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    public func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    public func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
}


// MARK: - Location Manager Delegate

extension LocationViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationUpdateCallback?(location)
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            print("Latitude: \(latitude), Longitude: \(longitude)")
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            // User granted permission
            startUpdatingLocation()
        case .restricted, .denied:
            // User denied or restricted location access
            break
        case .notDetermined:
            // Authorization status not determined yet
            break
        @unknown default:
            break
        }
    }
    
}

