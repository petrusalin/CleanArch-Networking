//
//  StackRouter.swift
//
//
//  Created by Alin Petrus on 19.02.2024.
//

import Foundation
import SwiftUI

public protocol StackRouter<NavigationRoute> {
    associatedtype NavigationRoute: Hashable
    
    func push(route: NavigationRoute)
    
    func pop()
    
    func popToRoot()
}
