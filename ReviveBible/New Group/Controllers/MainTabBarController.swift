//
//  MainTabBarController.swift
//  ReviveBible
//
//  Created by Chris Villanueva on 3/18/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeViewController = HomeViewController()
        homeViewController.title = "Home"
        let bibleViewController = BibleViewController()
        bibleViewController.title = "Bible"
        viewControllers = [homeViewController, bibleViewController]
        
    }
}
