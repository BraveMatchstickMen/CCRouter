//
//  RouterContext.swift
//  CCRouter
//
//  Created by chai.chai on 2019/4/4.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import Foundation

public class RouterContext: NSObject {

    public var title: String?
    public var parameters: NSDictionary?
    public let navigationType: NavigationType
    public var transition: UIViewControllerAnimatedTransitioning?
    public var animated: Bool
    public var callBack: RouterCallBack?

    public init(title: String? = nil,
                parameters: NSDictionary? = nil,
                navigationType: NavigationType,
                transition: UIViewControllerAnimatedTransitioning? = nil,
                animated: Bool = true) {
        self.title = title
        self.parameters = parameters
        self.navigationType = navigationType
        self.animated = animated
    }
}
