//
//  ViewFactory.swift
//
//
//  Created by Alin Petrus on 22.02.2024.
//

import Foundation
import SwiftUI

public protocol ViewFactory<NavigationRoute> {
    associatedtype ContentView: View
    associatedtype NavigationRoute: Routable
    
    func view(forRoute route: NavigationRoute) -> ContentView
}
