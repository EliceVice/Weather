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
    
    private let locationViewModel: LocationViewModelProtocol
    private let weatherViewModel: WeatherViewModelProtocol
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    
    init(locationViewModel: LocationViewModelProtocol, weatherViewModel: WeatherViewModelProtocol) {
        self.locationViewModel = locationViewModel
        self.weatherViewModel = weatherViewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTheController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationViewModel.requestLocationAuthorization()
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
    
    deinit {
        print("deinit \(self)")
    }

}


// MARK: - Setting position of the UI elements

private extension WeatherVC {
    
}


// MARK: - Table View DataSource and Delegate

extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return UITableViewCell()
    }
}

extension WeatherVC: UITableViewDelegate {
    
}

