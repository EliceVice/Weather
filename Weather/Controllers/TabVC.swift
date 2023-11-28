//
//  TabVC.swift
//  Weather
//
//  Created by Andrei Isayenka on 18/11/2023.
//

import UIKit

final class TabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addAndConfigureControllers()
    }
    
    private func addAndConfigureControllers() {
        let tab1 = WeatherVC()
        let tab2 = SettingsVC()
        
        tab1.title = "Weather"
        tab2.title = "Settings"
        
        let nav1 = UINavigationController(rootViewController: tab1)
        let nav2 = UINavigationController(rootViewController: tab2)
        
        nav1.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 2)
        
        setViewControllers([nav1, nav2], animated: true)
        viewControllers = [nav1, nav2]
    }

}
