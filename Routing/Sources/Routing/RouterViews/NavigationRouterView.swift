//
//  NavigationRouterView.swift
//
//
//  Created by Alin Petrus on 22.02.2024.
//

import SwiftUI

public struct NavigationRouterView<Route: Routable, Factory: ViewFactory<Route>, Content: View>: View {
    @ObservedObject private var router: StackRouter<Route>
    private let viewFactory: Factory
    private let content: () -> Content

    public var body: some View {
        NavigationStack(path: self.$router.navigationPath) {
            content()
                .navigationDestination(for: Factory.NavigationRoute.self) { route in
                    self.viewFactory.view(forRoute: route)
                }
        }
    }
    
    public init(router: StackRouter<Route>,
                viewFactory: Factory,
                content: @escaping () -> Content) {
        self.router = router
        self.viewFactory = viewFactory
        self.content = content
    }
}
