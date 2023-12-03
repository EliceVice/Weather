//
//  APIService.swift
//  Weather
//
//  Created by Andrei Isayenka on 25/11/2023.
//

import Foundation
import OpenMeteoSdk


protocol APIServiceProtocol {
    func getWeather() -> Weather
}

final class APIService: APIServiceProtocol {
    
    // Create a property with a path to the API
    // ...
    
    public func getWeather() -> Weather {
        
        // Get the weather from the API
        
        // Return the weather in the completion handler
        
        return Weather()
    }
    
}
