//
//  SheetRouter.swift
//
//
//  Created by Alin Petrus on 22.02.2024.
//

import Foundation

public final class SheetRouter<NavigationRoute: Routable>: Router {
    
    @Published public var route: NavigationRoute?
    
    public init() {}
    
    public func navigate(to route: NavigationRoute) {
        self.route = route
    }
    
    public func navigateBack() {
        self.route = nil
    }
    
    public func navigateToRoot() {
        self.route = nil
    }
}
