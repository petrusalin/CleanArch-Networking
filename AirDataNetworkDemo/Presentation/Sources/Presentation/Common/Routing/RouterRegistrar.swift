//
//  MainRoutingCoordinator.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.02.2024.
//

import Domain
import Foundation
import SwiftUI

private struct RouterView<Route: Routable, Content: View>: View {
    @ObservedObject var router: ConcreteRouter<Route>
    private let content: () -> Content
    private let coordinator: Coordinator<Route>
    
    var body: some View {
        NavigationStack(path: self.$router.navigationPath) {
            content()
        }
        .environmentObject(self.coordinator)
    }
    
    init(router: ConcreteRouter<Route>, coord content: @escaping () -> Content) {
        self.router = router
        self.content = content
        self.coordinator = Coordinator(router: router)
    }
}

private struct RouterRegistrar<Route: Routable, Factory: ViewFactory<Route>>: ViewModifier {
    @ObservedObject var router: ConcreteRouter<Route>
    private let viewFactory: Factory
    
    public init(router: ConcreteRouter<Route>,
                viewFactory: Factory) {
        self.router = router
        self.viewFactory =  viewFactory
    }
    
    public func body(content: Content) -> some View {
        RouterView(router: self.router) {
            content
            .navigationDestination(for: Factory.NavigationRoute.self) { route in
                self.viewFactory.view(forRoute: route)
            }
        }
        .sheet(item: self.$router.sheetRoute) { route in
            self.viewFactory.view(forRoute: route)
        }
    }
}

public extension View {
    func register<Route: Routable, Factory: ViewFactory<Route>>(router: ConcreteRouter<Route>, factory: Factory) -> some View {
        modifier(RouterRegistrar(router: router, viewFactory: factory))
    }
    
    func register<Route: Routable, Factory: ViewFactory<Route>>(routingPair: RoutingPair<Route, Factory>) -> some View {
        self.register(router: routingPair.router, factory: routingPair.factory)
    }
}
