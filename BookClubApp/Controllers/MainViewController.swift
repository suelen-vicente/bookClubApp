//
//  MainViewController.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-17.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: .actions, tag: 0)
        
        let shelfVC = UINavigationController(rootViewController: ShelfViewController())
        shelfVC.tabBarItem = UITabBarItem(title: "Shelf", image: .add, tag: 1)
        
        let friendsVC = UINavigationController(rootViewController: FriendsViewController())
        friendsVC.tabBarItem = UITabBarItem(title: "Friends", image: .checkmark, tag: 2)
        
        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: .remove, tag: 3)
        
        viewControllers = [homeVC, shelfVC, friendsVC, settingsVC]
    }

}
