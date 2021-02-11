//
//  TabbarController.swift
//  MoviesApp
//
//  Created by Igor Belobrov on 03.02.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let firstViewController = ListViewController()
        let secondViewController = FavouritesViewController()
        
        firstViewController.tabBarItem = UITabBarItem(title: "List",
                                                      image: UIImage(systemName: "doc"),
                                                      selectedImage: UIImage(systemName: "doc.fill"))
        secondViewController.tabBarItem = UITabBarItem(title: "Favourites",
                                                       image: UIImage(systemName: "suit.heart"),
                                                       selectedImage: UIImage(systemName: "suit.heart.fill"))
        
        setViewControllers([firstViewController, secondViewController], animated: true)
        selectedViewController = firstViewController
    }
}

