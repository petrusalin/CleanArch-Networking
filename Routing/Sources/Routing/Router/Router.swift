//
//  Router.swift
//  
//
//  Created by Alin Petrus on 22.02.2024.
//

import Foundation

public protocol Router<NavigationRoute>: ObservableObject {
    associatedtype NavigationRoute: Routable
    
    func navigate(to route: NavigationRoute)
    
    func navigateBack()
    
    func navigateToRoot()
}
