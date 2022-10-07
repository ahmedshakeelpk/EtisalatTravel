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

//        let homeVC = HomeRouter.setupModule()
//        let homeNav = BaseNavigationController(rootViewController: homeVC, colorScheme: .blue)
//        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "ic_Home_inactive"), selectedImage: UIImage(named: "ic_Home_active"))
//
//        let walletVC = WalletRouter.setupModule()
//        let walletNav = BaseNavigationController(rootViewController: walletVC)
//        walletNav.tabBarItem = UITabBarItem(title: "Wallet", image: UIImage(named: "ic_Wallet_inactive"), selectedImage: UIImage(named: "ic_Wallet_active"))
//
//        let qrCodeVC = QRCodeViewController.instantiate(fromAppStoryboard: .AddSendMoney)
//        let qrCodeNav = BaseNavigationController(rootViewController: qrCodeVC)
//        qrCodeNav.tabBarItem = UITabBarItem(title: "QRCode", image: UIImage(named: "ic_QRCode_inactive"), selectedImage: UIImage(named: "ic_QRCode_active"))
//
//        let profileVC = ProfileRouter.setupModule()
//        let profileNav = BaseNavigationController(rootViewController: profileVC)
//        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "ic_Profile_inactive"), selectedImage: UIImage(named: "ic_Profile_active"))
                
        
        //let controllers = [homeNav, walletNav, qrCodeNav, profileNav]
        //self.viewControllers = controllers

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


