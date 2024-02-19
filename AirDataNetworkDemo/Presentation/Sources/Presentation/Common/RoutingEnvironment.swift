//
//  RoutingEnvironment.swift
//  
//
//  Created by Alin Petrus on 19.02.2024.
//

import Foundation
import SwiftUI

public struct RoutingCoordinatorKey: EnvironmentKey {
    public static var defaultValue: RoutingCoordinator?
}

public extension EnvironmentValues {
    var coordinator: RoutingCoordinator? {
        get { self[RoutingCoordinatorKey.self] }
        set { self[RoutingCoordinatorKey.self] = newValue }
    }
}
