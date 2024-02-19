//
//  RoutingCoordinator.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.02.2024.
//

import Domain
import Foundation
import SwiftUI

public struct RoutingCoordinator {
    @Binding var path: NavigationPath
    
    public init(path: Binding<NavigationPath>) {
        self._path = path
    }
    
    func push(route: Route) {
        self.path.append(route)
    }
    
    func pop() {
        self.path.removeLast()
    }
    
    func popToRoot() {
        self.path = NavigationPath()
    }
}

extension RoutingCoordinator: ViewModifier {
    public func body(content: Content) -> some View {
        NavigationStack(path: self.$path) {
            content
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .Posts(let postRoute):
                        switch postRoute {
                        case .detail(let post):
                            PostDetailsView(viewModel: PostDetailsViewModel(postEntity: post))
                        case .dummy:
                            DummyView()
                        }
                    }
                }
        }
        .environment(\.coordinator, self)
    }
}

public extension View {
    func register(coordinator: RoutingCoordinator) -> some View {
        modifier(coordinator)
    }
}
