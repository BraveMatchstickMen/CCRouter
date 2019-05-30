//
//  ListingViewControllerFactory.swift
//  CCRouterDemo
//
//  Created by chai.chai on 2019/5/30.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import Foundation
import CCRouter

class ListingViewControllerFactory: ViewControllerFactory {
    required init() {

    }

    func make(context: RouterContext) -> UIViewController? {
        guard let parameter = context.parameters,
            let gender = parameter["gender"] as? Int,
            let productId = parameter["productId"] as? Int else {
                return nil
        }

        let listingViewController = ListingViewController(title: context.title ?? "", gender: gender, productId: productId)
        return listingViewController
    }
}
