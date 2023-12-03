//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Andrei Isayenka on 25/11/2023.
//

import Foundation

protocol WeatherViewModelProtocol {
    func getWeatherInformation()
}

final class WeatherViewModel: WeatherViewModelProtocol {
    
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    public func getWeatherInformation() {
        let weather = apiService.getWeather()
        
        // do something with the weather
        print(weather)
    }
    
}

