//
//  DetailViewControllerFactory.swift
//  CCRouterDemo
//
//  Created by chai.chai on 2019/4/4.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import Foundation
import CCRouter

class DetailViewControllerFactory: ViewControllerFactory {
    required init() {

    }

    func make(context: RouterContext) -> UIViewController? {
        guard let parameter = context.parameters,
            let gender = parameter["gender"] as? Int,
            let productId = parameter["productId"] as? Int else {
            return nil
        }

        let detailViewController = DetailViewController(title: context.title ?? "", gender: gender, productId: productId)
        return detailViewController
    }
}
