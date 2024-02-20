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

private struct Coordinator<Router: StackRouter, Factory: ViewFactory>: ViewModifier {
    private let router: Router
    private let viewFactory: Factory
    
    public init(router: Router, 
                viewFactory: Factory) where Router.NavigationRoute == Factory.NavigationRoute {
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
    }
}

public extension View {
    func register<Router: StackRouter, Factory: ViewFactory>(router: Router, factory: Factory) -> some View where Router.NavigationRoute == Factory.NavigationRoute {
        modifier(Coordinator(router: router, viewFactory: factory))
    }
}
