//
//  LocationViewModel.swift
//  Weather
//
//  Created by Andrei Isayenka on 29/11/2023.
//

import Foundation
import CoreLocation

protocol WeatherViewModelProtocol {
    var currentLocation: CLLocation? { get }
    func requestLocationAuthorization()
}

final class WeatherViewModel: NSObject, WeatherViewModelProtocol {
    
    private let apiService: APIServiceProtocol
    private let locationManager = CLLocationManager()
    private(set) var currentLocation: CLLocation?
    
    public var locationUpdateCallback: ((CLLocation) -> Void)?
    
    
    override init() {
        apiService = APIService()
        super.init()
        locationManager.delegate = self
    }
    
    
    public func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func requestWeatherForLocation() {
        // Get current coordinates
        guard let currentLocation else { return }
        
        let lat = currentLocation.coordinate.latitude
        let long = currentLocation.coordinate.longitude
        
        // TODO: Here we well get the weather from the API
        // ...
//        print("\(long) | \(lat)")
        apiService.getWeatherFor(lat: lat, long: long, daysAmount: 10) { recievedWeather, recievedError in
            if let recievedWeather, recievedError == nil {
//                print(recievedWeather.current, recievedWeather.forecast, recievedWeather.location, "\n" , recievedWeather.forecast.forecastday.count)
            }
        }
        
    }
    
}


// MARK: - Location Manager Delegate

extension WeatherViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Check if locations is not empty and ensure that currentLocation is nil
        if !locations.isEmpty, currentLocation == nil {
            // Set the current location, callback to update the UI in the future from VC, stop updating
            currentLocation = locations.first
            locationUpdateCallback?(currentLocation!)
            locationManager.stopUpdatingLocation()
            
            // Get the weather from the API
            requestWeatherForLocation()
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Get authorization status
        let status = manager.authorizationStatus
        
        // If user provided access to the location, start updating it. Otherwise do nothing.
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            // User granted permission
            locationManager.startUpdatingLocation()
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

