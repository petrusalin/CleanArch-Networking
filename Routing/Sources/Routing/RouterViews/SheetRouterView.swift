//
//  SheetRouterView.swift
//
//
//  Created by Alin Petrus on 22.02.2024.
//

import SwiftUI

public struct SheetRouterView<Route: Routable, Factory: ViewFactory<Route>, Content: View>: View {
    @ObservedObject private var router: SheetRouter<Route>
    private let viewFactory: Factory
    private let content: () -> Content
    
    public var body: some View {
        content()
            .sheet(item: self.$router.route) { route in
                self.viewFactory.view(forRoute: route)
            }
    }
    
    public init(router: SheetRouter<Route>,
                viewFactory: Factory,
                content: @escaping () -> Content) {
        self.router = router
        self.viewFactory = viewFactory
        self.content = content
    }
    
}
