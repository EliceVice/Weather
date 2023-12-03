//
//  APIService.swift
//  Weather
//
//  Created by Andrei Isayenka on 25/11/2023.
//

import Foundation
import Alamofire

protocol APIServiceProtocol {
    func getWeatherFor(lat: Double,
                       long: Double,
                       daysAmount days: Int,
                       callback: @escaping (_ recievedWeather: Weather?, _ recievedError: Error?) -> ())
}

final class APIService: APIServiceProtocol {

    private let baseUrl = "https://api.weatherapi.com/v1/forecast.json?"
    private let apiKey = "58a4705d83724e77a51161450230312"
    
    private let decoder = JSONDecoder()
    
    public func getWeatherFor(
        lat: Double,
        long: Double,
        daysAmount days: Int = 10,
        callback: @escaping (_ recievedWeather: Weather?, _ recievedError: Error?) -> ()
    ) {
        // Creating url
        let url = URL(string: "\(baseUrl)key=\(apiKey)&q=\(lat),\(long)&days=\(days)")!
        
        // Getting the weather
        AF.request(url, method: .get, encoding: JSONEncoding.default).response { [weak self] response in
            guard let self else { return }
            print(url)
            // Switch on the result and handle appropriate
            switch response.result {
            case .success(let data):
                guard let data else {
                    // data is nil
                    callback(nil, response.error)
                    return
                }
                // Fetch the data
                do {
                    // Everything worked
                    let weather = try self.decoder.decode(Weather.self, from: data)
                    callback(weather, nil)
                } catch {
                    // Something went wrong when decoding, notify the user
                    callback(nil, error)
                }
            case .failure(let error):
                // Response failed
                callback(nil, error)
            }
        }
    }
    
}

