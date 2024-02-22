//
//  Coordinator.swift
//  
//
//  Created by Alin Petrus on 22.02.2024.
//

import Foundation

public final class Coordinator<Route: Routable>: Router, ObservableObject {
    private let goToRouteBlock: (_ route: Route) -> Void
    private let goBackBlock: () -> Void
    private let resetBlock: () -> Void
    
    init<R: Router<Route>>(router: R) {
        self.goToRouteBlock = router.go(to:)
        self.goBackBlock = router.goBack
        self.resetBlock = router.reset
    }
    
    public func go(to route: Route) {
        self.goToRouteBlock(route)
    }
    
    public func goBack() {
        self.goBackBlock()
    }
    
    public func reset() {
        self.resetBlock()
    }
}

extension Router {
    
    func asCoordinator() -> Coordinator<NavigationRoute> {
        Coordinator(router: self)
    }
    
}
