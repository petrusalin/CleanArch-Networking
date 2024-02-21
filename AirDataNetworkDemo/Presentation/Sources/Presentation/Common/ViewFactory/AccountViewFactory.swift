//
//  AccountViewFactory.swift
//
//
//  Created by Alin Petrus on 19.02.2024.
//

import SwiftUI

public struct AccountViewFactory: ViewFactory {
    
    public init() {}
    
    @ViewBuilder
    public func view(forRoute route: Route.AccountSettings) -> some View {
        switch route {
        case .main:
            AccountView()
        case .profile:
            ProfileView()
        case .security:
            SecurityView()
        }
    }
    
}
