//
//  HomeTabBarController.swift
//  eWallet
//
//  Created by Faran Rasheed on 11/08/2021.
//

import UIKit

class HomeTabBarController: UITabBarController, UITabBarControllerDelegate {
//
//    override var selectedIndex: Int { // Mark 1
//        didSet {
//            guard let selectedViewController = viewControllers?[selectedIndex] else {
//                return
//            }
//            selectedViewController.tabBarItem.setTitleTextAttributes([.font: AppFont.appSemiBold(size: 13) ], for: .normal)
//        }
//    }
//
//    override var selectedViewController: UIViewController? { // Mark 2
//        didSet {
//            guard let viewControllers = viewControllers else {
//                return
//            }
//            for viewController in viewControllers {
//                if viewController == selectedViewController {
//                    viewController.tabBarItem.setTitleTextAttributes([.font: AppFont.appSemiBold(size: 13) ], for: .normal)
//                } else {
//                    viewController.tabBarItem.setTitleTextAttributes([.font: AppFont.appRegular(size: FontSize.xxSmall) ], for: .normal)
//                }
//            }
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        tabBar.tintColor = UIColor.init(hexString: "#D1392B")
        tabBar.backgroundColor = .white;
        tabBar.unselectedItemTintColor = UIColor.init(hexString: "#575757",alpha: 0.74)

        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 14) ], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 14) ], for: .selected)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -8)

        guard let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Dashboard") as? Dashboard else {return}

        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(named: "Shop-gray"), selectedImage: UIImage(named: "Shop"))
        
        
        guard let shopVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Dashboard") as? Dashboard else {return}

        let shopNav = UINavigationController(rootViewController: shopVC)
        shopNav.tabBarItem = UITabBarItem(title: "My eSIMs", image: UIImage(named: "myeSIMS-gray"), selectedImage: UIImage(named: "myeSIMS"))
        
        
        guard let profileVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Dashboard") as? Dashboard else {return}

        let profileNav = UINavigationController(rootViewController: profileVC)
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile-gray"), selectedImage: UIImage(named: "profile"))


        let controllers = [homeNav, shopNav, profileNav]
        self.viewControllers = controllers

        self.selectedIndex = 0
        
        if let cornerTabBar = self.tabBar as? TabBarWithCorners {
            cornerTabBar.refreshCorner(radius:0)
        }
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


