//
//  Router.swift
//  CCRouter
//
//  Created by chai.chai on 2019/4/3.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import Foundation
import UIKit

public protocol ViewControllerFactory {
    init()
    func make(context: RouterContext) -> UIViewController?
}

public typealias Pattern = String
public typealias RouterCallBack = (Any) -> Void

public class Router: NSObject {

    private var storage: [Pattern: String] = [:]

    public var navigation = Navigation.shared
    public static let shared = Router()

    public func register(_ pattern: Pattern, factory: AnyClass) {
        guard factory is ViewControllerFactory.Type else {
            assertionFailure("\(NSStringFromClass(factory)) does not comply with ViewControllerFactory")
            return
        }
        storage[pattern] = NSStringFromClass(factory)
    }

    public func route(_ pattern: Pattern, context: RouterContext, callBack: RouterCallBack? = nil) {
        handlePattern(pattern, context: context, callBack: callBack)
    }

    public func openExternal() {

    }
}

private extension Router {

    func handlePattern(_ patter: Pattern, context: RouterContext, callBack: RouterCallBack? = nil) {
        context.callBack = callBack
        guard let factory = createFactory(patter),
            let controller = factory.make(context: context) else {
            return
        }
        navigation.show(controller, context: context)
    }

    func createFactory(_ pattern: Pattern) -> ViewControllerFactory? {
        guard let factory = factoryImplClass(pattern) as? ViewControllerFactory.Type else {
            assertionFailure("\(pattern) Impl Class not comply ViewControllerFactory")
            return nil
        }
        return factory.init()
    }

    func factoryImplClass(_ pattern: Pattern) -> AnyClass? {
        for (key, value) in storage {
            if key == pattern {
                guard let implClass = NSClassFromString(value) else {
                    assertionFailure("\(pattern) has not been registered")
                    return nil
                }
                return implClass
            }
        }
        assertionFailure("\(pattern) has not been registered")
        return nil
    }
}
