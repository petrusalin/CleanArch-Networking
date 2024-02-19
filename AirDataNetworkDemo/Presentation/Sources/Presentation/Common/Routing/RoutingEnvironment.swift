//
//  RoutingEnvironment.swift
//  
//
//  Created by Alin Petrus on 19.02.2024.
//

import Foundation
import SwiftUI

public struct RoutingCoordinatorKey: EnvironmentKey {
    public static var defaultValue: MainRoutingCoordinator?
}

public extension EnvironmentValues {
    var coordinator: MainRoutingCoordinator? {
        get { self[RoutingCoordinatorKey.self] }
        set { self[RoutingCoordinatorKey.self] = newValue }
    }
}
