//
//  ModalRouter.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import Foundation

public protocol ModalRouter<NavigationRoute>: ObservableObject {
    associatedtype NavigationRoute: Routable
    
    var sheetRoute: NavigationRoute? { get set }
    
    func present(route: NavigationRoute)
    func dismiss()
}

public extension ModalRouter {
    
    func present(route: NavigationRoute) {
        self.sheetRoute = route
    }
    
    func dismiss() {
        self.sheetRoute = nil
    }
}
