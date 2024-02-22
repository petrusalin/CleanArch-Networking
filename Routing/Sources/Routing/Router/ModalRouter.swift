//
//  ModalRouter.swift
//
//
//  Created by Alin Petrus on 22.02.2024.
//

import Foundation

public final class ModalRouter<NavigationRoute: Routable>: Router {
    
    @Published public var sheetRoute: NavigationRoute?
    
    public init() {}
    
    public func go(to route: NavigationRoute) {
        self.sheetRoute = route
    }
    
    public func goBack() {
        self.sheetRoute = nil
    }
    
    public func reset() {
        self.sheetRoute = nil
    }
}
