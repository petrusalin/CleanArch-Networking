//
//  CompositeRouter.swift
//
//
//  Created by Alin Petrus on 22.02.2024.
//

import Foundation
import Combine
import SwiftUI

open class CompositeRouter<NavigationRoute: Routable>: Router {
    public let stackRouter: StackRouter<NavigationRoute>
    public let modalRouter: ModalRouter<NavigationRoute>
    
    public init(stackRouter: StackRouter<NavigationRoute>,
                modalRouter: ModalRouter<NavigationRoute>) {
        self.stackRouter = stackRouter
        self.modalRouter = modalRouter
    }
    
    // override
    open func go(to route: NavigationRoute) {
        self.stackRouter.go(to: route)
    }
    
    public func goBack() {
        if self.modalRouter.sheetRoute != nil {
            self.modalRouter.goBack()
        } else {
            self.stackRouter.goBack()
        }
    }
    
    public func reset() {
        if self.modalRouter.sheetRoute != nil {
            self.modalRouter.reset()
        }
        self.stackRouter.reset()
    }
    
}
