//
//  HomeTabBarController.swift
//  eWallet
//
//  Created by Faran Rasheed on 11/08/2021.
//

import UIKit

class HomeTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        self.navigationBarHidden()

        super.viewDidLoad()
        self.delegate = self

        tabBar.tintColor = UIColor.init(hexString: "#D1392B")
        tabBar.backgroundColor = .white;
        tabBar.unselectedItemTintColor = UIColor.init(hexString: "#575757",alpha: 0.74)

        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 14) ], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 14) ], for: .selected)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -8)

        
        
        if let cornerTabBar = self.tabBar as? TabBarWithCorners {
            cornerTabBar.refreshCorner(radius:0)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let isPackageSubscribed = defaults.value(forKey: "isPackageSubscribed") {
            guard let dataUsageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DataUsage") as? DataUsage else {return}
            let homeNav = UINavigationController(rootViewController: dataUsageVC)
            homeNav.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(named: "Shop-gray"), selectedImage: UIImage(named: "Shop"))

            guard let dataUsageVC1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DataUsage") as? DataUsage else {return}
            let shopNav = UINavigationController(rootViewController: dataUsageVC1)
            shopNav.tabBarItem = UITabBarItem(title: "My eSIMs", image: UIImage(named: "myeSIMS-gray"), selectedImage: UIImage(named: "myeSIMS"))

            guard let dataUsageVC2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DataUsage") as? DataUsage else {return}
            let profileNav = UINavigationController(rootViewController: dataUsageVC2)
            profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile-gray"), selectedImage: UIImage(named: "profile"))
            
            let controllers = [homeNav, shopNav, profileNav]
            self.viewControllers = controllers
        }else {
            guard let dashboardVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Dashboard") as? Dashboard else {return}
            let homeNav = UINavigationController(rootViewController: dashboardVC)
            homeNav.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(named: "Shop-gray"), selectedImage: UIImage(named: "Shop"))

            guard let dashboardVC1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Dashboard") as? Dashboard else {return}
            let shopNav = UINavigationController(rootViewController: dashboardVC1)
            shopNav.tabBarItem = UITabBarItem(title: "My eSIMs", image: UIImage(named: "myeSIMS-gray"), selectedImage: UIImage(named: "myeSIMS"))

            guard let dashboardVC2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Dashboard") as? Dashboard else {return}
            let profileNav = UINavigationController(rootViewController: dashboardVC2)
            profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile-gray"), selectedImage: UIImage(named: "profile"))
            
            let controllers = [homeNav, shopNav, profileNav]
            self.viewControllers = controllers
        }

        

        self.selectedIndex = 0
    }
}

extension HomeTabBarController {
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print("Selected item")
//    }
    
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print("Selected view controller")
//        
//        if let cornerTabBar = self.tabBar as? TabBarWithCorners {
//            if let baseNav = viewController as? BaseNavigationController, let homeVC = baseNav.viewControllers.first as? HomeViewController  {
//                cornerTabBar.refreshCorner(radius:0)
//            }else{
//                cornerTabBar.refreshCorner()
//            }
//        }
//        
//
//    }
}


