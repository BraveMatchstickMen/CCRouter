//
//  CheckoutViewController.swift
//  CCRouterDemo
//
//  Created by chai.chai on 2019/5/30.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import UIKit
import CCRouter

class CheckoutViewController: UIViewController {
    let gender: Int
    let productId: Int
    let callback: RouterCallBack

    init(title: String,
         gender: Int,
         productId: Int,
         callback: @escaping RouterCallBack) {
        self.gender = gender
        self.productId = productId
        self.callback = callback

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
        self.navigationController?.popViewController(animated: true)
        callback("success")
    }
}
