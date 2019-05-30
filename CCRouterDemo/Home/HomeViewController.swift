//
//  HomeViewController.swift
//  CCRouterDemo
//
//  Created by chai.chai on 2019/4/4.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import UIKit
import CCRouter

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.view.backgroundColor = UIColor.white
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let context = RouterContext(title: "Listing", parameters: ["gender": 0, "productId": 1], navigationType: .push)
        Router.shared.route(RouterPattern.listing, context: context)
    }
}
