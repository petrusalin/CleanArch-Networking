//
//  MainRoutingCoordinator.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.02.2024.
//

import Domain
import Foundation
import SwiftUI

public struct MainRoutingCoordinator: StackRouter {
    @Binding var path: NavigationPath
    
    public init(path: Binding<NavigationPath>) {
        self._path = path
    }
    
    public func push(route: Route) {
        self.path.append(route)
    }
    
    public func pop() {
        self.path.removeLast()
    }
    
    public func popToRoot() {
        self.path = NavigationPath()
    }
    
}

extension MainRoutingCoordinator: ViewModifier {
    
    public func body(content: Content) -> some View {
        NavigationStack(path: self.$path) {
            content
                .navigationDestination(for: Route.self) { route in
                    self.view(forRoute: route)
                }
        }
        .environment(\.coordinator, self)
    }
    
    @ViewBuilder
    private func view(forRoute route: Route) -> some View {
        switch route {
        case .Posts(let postRoute):
            PostsViewFactory().view(forRoute: postRoute)
        case .Account(let accountSettings):
            AccountViewFactory().view(forRoute: accountSettings)
        }
    }
}

public extension View {
    func register(coordinator: MainRoutingCoordinator) -> some View {
        modifier(coordinator)
    }
}
