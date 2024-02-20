//
//  StackRouter.swift
//
//
//  Created by Alin Petrus on 20.02.2024.
//

import SwiftUI
import Foundation

public protocol StackRouter<NavigationRoute>: ObservableObject {
    associatedtype NavigationRoute: Hashable
    
    var navigationPath: NavigationPath { get set }
    
    func push(route: NavigationRoute)
    func pop()
    func popToRoot()
}
