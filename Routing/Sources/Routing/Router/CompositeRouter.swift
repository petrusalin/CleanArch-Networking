//
//  CompositeRouter.swift
//
//
//  Created by Alin Petrus on 22.02.2024.
//

import Foundation
import Combine
import SwiftUI

// Sublass and override `navigate(to:)` to have a complex router
open class CompositeRouter<NavigationRoute: Routable>: Router {
    public let stackRouter: StackRouter<NavigationRoute>
    public let sheetRouter: SheetRouter<NavigationRoute>
    public let modalRouter: ModalRouter<NavigationRoute>
    
    public init(stackRouter: StackRouter<NavigationRoute>,
                sheetRouter: SheetRouter<NavigationRoute>,
                modalRouter: ModalRouter<NavigationRoute>) {
        self.stackRouter = stackRouter
        self.sheetRouter = sheetRouter
        self.modalRouter = modalRouter
    }
    
    // override
    open func navigate(to route: NavigationRoute) {
        self.stackRouter.navigate(to: route)
    }
    
    public func navigateBack() {
        if self.modalRouter.route != nil {
            self.modalRouter.navigateBack()
        } else if self.sheetRouter.route != nil {
            self.sheetRouter.navigateBack()
        } else {
            self.stackRouter.navigateBack()
        }
    }
    
    public func navigateToRoot() {
        if self.sheetRouter.route != nil {
            self.sheetRouter.navigateToRoot()
        }
        
        if self.modalRouter.route != nil {
            self.modalRouter.navigateToRoot()
        }
        
        self.stackRouter.navigateToRoot()
    }
    
}
