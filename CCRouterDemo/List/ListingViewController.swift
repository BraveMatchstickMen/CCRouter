//
//  ListingViewController.swift
//  CCRouterDemo
//
//  Created by chai.chai on 2019/5/30.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import UIKit
import CCRouter

class ListingViewController: UIViewController {
    let gender: Int
    let productId: Int

    init(title: String,
         gender: Int,
         productId: Int) {
        self.gender = gender
        self.productId = productId

        super.init(nibName: nil, bundle: nil)

        self.title = title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let context = RouterContext(title: "Detail", parameters: ["gender": 0, "productId": 1], navigationType: .push)
        Router.shared.route(RouterPattern.detail, context: context)
    }
}
