//
//  StackRouter.swift
//
//
//  Created by Alin Petrus on 20.02.2024.
//

import SwiftUI
import Foundation

public protocol StackRouter<NavigationRoute>: ObservableObject {
    associatedtype NavigationRoute: Routable
    
    var navigationPath: NavigationPath { get set }
    
    func push(route: NavigationRoute)
    func pop()
    func popToRoot()
}

public extension StackRouter {
    
    func push(route: NavigationRoute) {
        self.navigationPath.append(route)
    }
    
    func pop() {
        self.navigationPath.removeLast()
    }
    
    func popToRoot() {
        self.navigationPath = NavigationPath()
    }
}
