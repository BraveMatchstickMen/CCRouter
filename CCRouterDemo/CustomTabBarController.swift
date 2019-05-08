//
//  CustomTabBarController.swift
//  CCRouterDemo
//
//  Created by chai.chai on 2019/4/4.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let home = HomeViewController()
        self.addChildViewController(childerVC: home, title: "首页", normalImg: "", selectedImg: "")

        let myShowVC = MeViewController()
        self.addChildViewController(childerVC: myShowVC, title: "我", normalImg: "", selectedImg: "")

        self.selectedIndex = 0
    }

    func addChildViewController(childerVC: UIViewController, title: String, normalImg: String? = nil, selectedImg: String? = nil)  {
        self.tabBarItem.title = title
        childerVC.title = title

        let tabItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        let nv = UINavigationController(rootViewController: childerVC)

        childerVC.tabBarItem = tabItem

        self.addChild(nv)
    }
}
