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
        self.goToRouteBlock = router.navigate(to:)
        self.goBackBlock = router.navigateBack
        self.resetBlock = router.navigateToRoot
    }
    
    public func navigate(to route: Route) {
        self.goToRouteBlock(route)
    }
    
    public func navigateBack() {
        self.goBackBlock()
    }
    
    public func navigateToRoot() {
        self.resetBlock()
    }
}

extension Router {
    
    func asCoordinator() -> Coordinator<NavigationRoute> {
        Coordinator(router: self)
    }
    
}
