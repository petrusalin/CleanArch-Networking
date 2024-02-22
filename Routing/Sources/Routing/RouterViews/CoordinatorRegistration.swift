//
//  ModalCoordinatorView.swift
//
//
//  Created by Alin Petrus on 22.02.2024.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func setupCoordinator<Route: Routable, Navigator: Router<Route>, Factory: ViewFactory<Route>>(withRoutingPair pair: RoutingPair<Route, Navigator, Factory>) -> some View {
        if let stack = pair.router as? StackRouter<Route> {
            NavigationRouterView(router: stack, viewFactory: pair.factory, content: { self })
                .environmentObject(stack.asCoordinator())
        } else if let modal = pair.router as? ModalRouter<Route> {
            ModalRouterView(router: modal, viewFactory: pair.factory, content: { self })
                .environmentObject(modal.asCoordinator())
        } else if let composite = pair.router as? CompositeRouter<Route> {
            CompositeRouterView(router: composite, viewFactory: pair.factory, content: { self })
                .environmentObject(composite.asCoordinator())
        } else {
            self
        }
    }
}
