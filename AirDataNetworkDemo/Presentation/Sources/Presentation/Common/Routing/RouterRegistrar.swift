//
//  MainRoutingCoordinator.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.02.2024.
//

import Domain
import Foundation
import SwiftUI

private struct RouterView<Router: StackRouter, Content: View>: View {
    @ObservedObject var router: Router
    private let content: () -> Content
    
    var body: some View {
        NavigationStack(path: self.$router.navigationPath) {
            content()
        }
        .environmentObject(self.router)
    }
    
    init(router: Router, content: @escaping () -> Content) {
        self.router = router
        self.content = content
    }
}

private struct RouterRegistrar<Route: Hashable & Identifiable, Factory: ViewFactory<Route>>: ViewModifier {
    @ObservedObject var router: Router<Route>
    private let viewFactory: Factory
    
    public init(router: Router<Route>,
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
    func register<Route: Hashable & Identifiable, Factory: ViewFactory<Route>>(router: Router<Route>, factory: Factory) -> some View {
        modifier(RouterRegistrar(router: router, viewFactory: factory))
    }
}
