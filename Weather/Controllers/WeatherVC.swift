//
//  ViewController.swift
//  Weather
//
//  Created by Andrei Isayenka on 18/11/2023.
//

import UIKit

// The location for the user: Core Location
// Weather for the upcoming days: Table View
// Hourly forecast for the current day: Collection View and custom cell
// API: request to get the data


final class WeatherVC: UIViewController {
    
    private var weatherViewModel: WeatherViewModelProtocol = WeatherViewModel()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTheController()
    }
    
    private func setupTheController() {
        
        // UI
        view.backgroundColor = .white
        navigationItem.title = nil
        
        // Register cells
        
        // Setup tableView
        tableView.delegate = self
        tableView.dataSource = self
    }

}


// MARK: - Setting position of the UI elements methods

private extension WeatherVC {
    
}


// MARK: - Table View Delegate

extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}


// MARK: - Table View DataSource

extension WeatherVC: UITableViewDelegate {
    
}

