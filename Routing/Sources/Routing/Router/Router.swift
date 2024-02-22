//
//  Router.swift
//  
//
//  Created by Alin Petrus on 22.02.2024.
//

import Foundation

public protocol Router<NavigationRoute>: ObservableObject {
    associatedtype NavigationRoute: Routable
    
    func go(to route: NavigationRoute)
    
    func goBack()
    
    func reset()
}
