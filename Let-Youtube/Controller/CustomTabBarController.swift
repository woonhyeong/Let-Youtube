//
//  CustomTabBarController.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/17.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeController = HomeController()
        let homeNavController = UINavigationController(rootViewController: homeController)
        homeNavController.tabBarItem.title = "Home"
        homeNavController.tabBarItem.image = UIImage(named: "ico_home")
        
        let trendingController = TrendingController()
        let trendingNavController = UINavigationController(rootViewController: trendingController)
        trendingNavController.tabBarItem.title = "Trend"
        trendingNavController.tabBarItem.image = UIImage(named: "ico_trend")
        
        let subscriptController = SubscriptController()
        let subscriptNavController = UINavigationController(rootViewController: subscriptController)
        subscriptNavController.tabBarItem.title = "Subscript"
        subscriptNavController.tabBarItem.image = UIImage(named: "ico_subscript")
        
        let lockerController = LockerController()
        let lockerNavController = UINavigationController(rootViewController: lockerController)
        lockerNavController.tabBarItem.title = "Locker"
        lockerNavController.tabBarItem.image = UIImage(named: "ico_account")
        
        viewControllers = [homeNavController, trendingNavController, subscriptNavController, lockerNavController]
        
        UITabBar.appearance().tintColor = UIColor.red
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
