//
//  MarvelTabBarController.swift
//  MarvelList
//
//  Created by Daniel Silva on 9/16/18.
//  Copyright © 2018 Daniel Silva. All rights reserved.
//

import UIKit

class MarvelTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Marvel Comics"
        
        let homeVC = HomeVC()
        
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let favoritesVC = FavoritesVC()
        
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites , tag: 1)
        
        let tabBarList = [homeVC, favoritesVC]
        
        viewControllers = tabBarList
    }
}
