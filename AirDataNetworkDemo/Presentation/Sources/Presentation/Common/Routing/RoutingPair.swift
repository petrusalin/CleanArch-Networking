//
//  RoutingPair.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import Foundation

public struct RoutingPair<Route: Routable, Factory: ViewFactory<Route>> {
    public let router: ConcreteRouter<Route>
    public let factory: Factory
    
    public init(router: ConcreteRouter<Route>, factory: Factory) {
        self.router = router
        self.factory = factory
    }
}
