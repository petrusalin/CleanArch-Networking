//
//  StackRouter.swift
//
//
//  Created by Alin Petrus on 22.02.2024.
//

import Foundation
import SwiftUI

public final class StackRouter<NavigationRoute: Routable>: Router {
    
    @Published public var navigationPath: NavigationPath
    
    public init(navigationPath: NavigationPath = NavigationPath()) {
        self.navigationPath = navigationPath
    }
    
    public func navigate(to route: NavigationRoute) {
        self.navigationPath.append(route)
    }
    
    public func navigateBack() {
        self.navigationPath.removeLast()
    }
    
    public func navigateToRoot() {
        self.navigationPath = NavigationPath()
    }
    
}
