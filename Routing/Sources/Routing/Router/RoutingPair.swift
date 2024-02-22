//
//  RoutingPair.swift
//
//
//  Created by Alin Petrus on 22.02.2024.
//

import Foundation

public struct RoutingPair<Route: Routable, Navigator: Router<Route>, Factory: ViewFactory<Route>> {
    public let router: Navigator
    public let factory: Factory
    
    public init(router: Navigator, factory: Factory) {
        self.router = router
        self.factory = factory
    }
}
