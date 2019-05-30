//
//  RouterMap.swift
//  CCRouterDemo
//
//  Created by chai.chai on 2019/4/4.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import Foundation
import CCRouter

class RouterMap {
    static func setup() {
        Router.shared.register(RouterPattern.listing, factory: ListingViewControllerFactory.self)
        Router.shared.register(RouterPattern.detail, factory: DetailViewControllerFactory.self)
        Router.shared.register(RouterPattern.shoppingBag, factory: ShoppingBagViewControllerFactory.self)
        Router.shared.register(RouterPattern.checkout, factory: CheckoutViewControllerFactory.self)
    }
}
