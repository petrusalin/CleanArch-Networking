//
//  ModalRouterView.swift
//  
//
//  Created by Alin Petrus on 18.03.2024.
//

import SwiftUI

public struct ModalRouterView<Route: Routable, Factory: ViewFactory<Route>, Content: View>: View {
    @ObservedObject private var router: ModalRouter<Route>
    private let viewFactory: Factory
    private let content: () -> Content
    
    public var body: some View {
        content()
            .fullScreenCover(item: self.$router.route) { route in
                self.viewFactory.view(forRoute: route)
            }
    }
    
    public init(router: ModalRouter<Route>,
                viewFactory: Factory,
                content: @escaping () -> Content) {
        self.router = router
        self.viewFactory = viewFactory
        self.content = content
    }
    
}
