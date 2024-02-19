//
//  ViewFactory.swift
//
//
//  Created by Alin Petrus on 19.02.2024.
//

import SwiftUI
import Foundation

public protocol ViewFactory<NavigationRoute> {
    associatedtype ContentView: View
    associatedtype NavigationRoute: Hashable
    
    func view(forRoute route: NavigationRoute) -> ContentView
}
