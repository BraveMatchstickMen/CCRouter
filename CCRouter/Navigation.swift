//
//  Navigation.swift
//  CCRouter
//
//  Created by chai.chai on 2019/4/4.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import Foundation
import UIKit

public enum NavigationType: Int {
    case push
    case mode
}

public class Navigation: NSObject {

    public static let shared = Navigation()
    public var viewControllers: [UIViewController] = []
    private var context: RouterContext!
    weak public var rootViewController: UIViewController?

    override init() {

    }

    public func root(_ viewController: UIViewController) {
        viewControllers = [viewController]
        rootViewController = viewController
    }

    public func show(_ viewController: UIViewController, context: RouterContext) {
        self.context = context
        switch context.navigationType {
        case .push:
            currentViewController?.navigationController?.pushViewController(viewController, animated: true)
        case .mode:
            currentViewController?.present(viewController, animated: true, completion: nil)
        }
    }
}

extension Navigation {

    public var currentViewController: UIViewController? {
        return self.currentViewController(of: rootViewController)
    }

    public func currentViewController(of viewController: UIViewController?) -> UIViewController? {
        if let presentedViewController = viewController?.presentedViewController {
            return self.currentViewController(of: presentedViewController)
        }

        if let tabBarController = viewController as? UITabBarController,
            let selectedViewController = tabBarController.selectedViewController {
            return self.currentViewController(of: selectedViewController)
        }

        if let navigationController = viewController as? UINavigationController,
            let visibleViewController = navigationController.visibleViewController {
            return self.currentViewController(of: visibleViewController)
        }

        if let pageViewController = viewController as? UIPageViewController,
            pageViewController.viewControllers?.count == 1 {
            return self.currentViewController(of: pageViewController.viewControllers?.first)
        }

        for subview in viewController?.view?.subviews ?? [] {
            if let childViewController = subview.next as? UIViewController {
                return self.currentViewController(of: childViewController)
            }
        }

        return viewController
    }
}
