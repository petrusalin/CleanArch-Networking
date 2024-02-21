//
//  Coordinator.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import Foundation
import Combine
import SwiftUI

final class Coordinator<Route: Routable>: Router, ObservableObject {
    private let router: ConcreteRouter<Route>
    @Published var path: NavigationPath
    @Published var sheetRoute: Route?
    
    init(router: ConcreteRouter<Route>) {
        self.router = router
        self.path = router.navigationPath
        self.sheetRoute = router.sheetRoute
        
        self.router.$navigationPath.assign(to: &self.$path)
        self.router.$sheetRoute.assign(to: &self.$sheetRoute)
    }
    
    func go(to route: Route) {
        self.router.go(to: route)
    }
    
    func goBack() {
        self.router.goBack()
    }
    
    func reset() {
        self.router.reset()
    }
}
