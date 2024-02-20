//
//  Router.swift
//  
//
//  Created by Alin Petrus on 20.02.2024.
//

import Foundation
import SwiftUI

public class Router<Route: Hashable>: StackRouter, ObservableObject {
    @Published public var navigationPath: NavigationPath
    
    public init(navigationPath: NavigationPath) {
        self.navigationPath = navigationPath
    }
    
    public func push(route: Route) {
        self.navigationPath.append(route)
    }
    
    public func pop() {
        self.navigationPath.removeLast()
    }
    
    public func popToRoot() {
        self.navigationPath = NavigationPath()
    }
}
