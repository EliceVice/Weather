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
    
    private var apiService: APIService
    
    init() {
        apiService = APIService()
    }
    
    public func getWeatherInformation() {
        let weather = apiService.getWeather()
        print(weather)
    }
    
}
