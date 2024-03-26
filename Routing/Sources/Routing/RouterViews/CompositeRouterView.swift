//
//  CompositeRouterView.swift
//
//
//  Created by Alin Petrus on 22.02.2024.
//

import SwiftUI

public struct CompositeRouterView<Route: Routable, Factory: ViewFactory<Route>, Content: View>: View {
    @ObservedObject var router: CompositeRouter<Route>
    private let viewFactory: Factory
    private let content: () -> Content
    
    public var body: some View {
        SheetRouterView(router: router.sheetRouter, viewFactory: viewFactory) {
            ModalRouterView(router: router.modalRouter, viewFactory: viewFactory) {
                NavigationRouterView(router: router.stackRouter,
                                     viewFactory: viewFactory,
                                     content: content)
            }
        }
    }
    
    public init(router: CompositeRouter<Route>,
                viewFactory: Factory,
                content: @escaping () -> Content) {
        self.router = router
        self.viewFactory = viewFactory
        self.content = content
    }
    
}
