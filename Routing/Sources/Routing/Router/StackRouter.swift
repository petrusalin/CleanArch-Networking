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
    
    public func go(to route: NavigationRoute) {
        self.navigationPath.append(route)
    }
    
    public func goBack() {
        self.navigationPath.removeLast()
    }
    
    public func reset() {
        self.navigationPath = NavigationPath()
    }
    
}
