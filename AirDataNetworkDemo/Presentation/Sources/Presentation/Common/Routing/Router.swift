//
//  Router.swift
//  
//
//  Created by Alin Petrus on 20.02.2024.
//

import Foundation
import SwiftUI

public class Router<Route: Hashable & Identifiable>: StackRouter, ModalRouter, ObservableObject {
    public typealias NavigationRoute = Route
    
    @Published public var navigationPath: NavigationPath
    @Published public var sheetRoute: Route?
    
    public init(navigationPath: NavigationPath) {
        self.navigationPath = navigationPath
    }
    
    public func go(to route: Route) {
        self.push(route: route)
    }
    
    public func goBack() {
        self.pop()
    }
    
    public func reset() {
        self.dismiss()
        self.popToRoot()
    }
    
}
