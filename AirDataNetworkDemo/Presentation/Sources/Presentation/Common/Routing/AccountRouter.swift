//
//  AccountRouter.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import Foundation
import SwiftUI

public final class AccountRouter: ConcreteRouter<Route.AccountSettings> {
    
    public convenience init() {
        self.init(navigationPath: NavigationPath())
    }
    
}
