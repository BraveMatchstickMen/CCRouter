//
//  CheckoutViewControllerFactory.swift
//  CCRouterDemo
//
//  Created by chai.chai on 2019/5/30.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import Foundation
import CCRouter

class CheckoutViewControllerFactory: ViewControllerFactory {
    required init() {

    }

    func make(context: RouterContext) -> UIViewController? {
        guard let parameter = context.parameters,
            let gender = parameter["gender"] as? Int,
            let productId = parameter["productId"] as? Int,
            let callback = context.callBack else {
                return nil
        }

        let checkoutBagViewController = CheckoutViewController(title: context.title ?? "", gender: gender, productId: productId, callback: callback)
        return checkoutBagViewController
    }
}
