//
//  ViewController.swift
//  RickAndMortey
//
//  Created by Zigi on 12/03/23.
//

import UIKit

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
        self.view.backgroundColor = .systemBackground
    }

    
    private func setUpTabs() {
        let episodes = RMEpisodeController()
        let locations  = RMLocationController()
        let charcters = RMCharcterController()
        let settings = RMSettingsController()
        episodes.navigationItem.largeTitleDisplayMode = .automatic
        locations.navigationItem.largeTitleDisplayMode = .automatic
        charcters.navigationItem.largeTitleDisplayMode = .automatic
        settings.navigationItem.largeTitleDisplayMode = .automatic
        let nav1 = UINavigationController(rootViewController: charcters)
        let nav2 = UINavigationController(rootViewController: locations)
        let nav3 = UINavigationController(rootViewController: episodes)
        let nav4 = UINavigationController(rootViewController: settings)
        nav1.tabBarItem = UITabBarItem(title: "Charcters", image: UIImage(systemName: "person"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        for nav in [nav1,nav2,nav3,nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        setViewControllers([nav1,nav2,nav3,nav4], animated: true)
    }

}

