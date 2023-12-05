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
    
    private let weatherViewModel: WeatherViewModelProtocol
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // Initializing using dependency injection
    init(weatherViewModel: WeatherViewModelProtocol) {
        self.weatherViewModel = weatherViewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    // Required init, but we're not using storyboards, so it is never going to get called
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTheController()
        addTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        weatherViewModel.requestLocationAuthorization()
    }
    
    
    private func setupTheController() {
        // UI
        view.backgroundColor = .white
        navigationItem.title = nil
        
        // Register cells
        
        // Setup tableView
        tableView.register(DailyTableViewCell.nib(), forCellReuseIdentifier: DailyTableViewCell.identifier)
        tableView.register(HourlyTableViewCell.nib(), forCellReuseIdentifier: HourlyTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    deinit {
        print("deinit \(self)")
    }

}


// MARK: - Setting position of the UI elements

private extension WeatherVC {
    func addTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}


// MARK: - Table View DataSource and Delegate

extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.identifier, for: indexPath) as? DailyTableViewCell else { return UITableViewCell() }
        
        return UITableViewCell()
    }
}

extension WeatherVC: UITableViewDelegate {
    
}

