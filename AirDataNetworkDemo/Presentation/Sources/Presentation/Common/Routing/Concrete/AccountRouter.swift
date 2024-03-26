//
//  AccountRouter.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import Foundation
import Routing
import SwiftUI

public final class AccountRouter: CompositeRouter<Route.AccountSettings> {
    
    convenience public init() {
        self.init(stackRouter: StackRouter(), 
                  sheetRouter: SheetRouter(),
                  modalRouter: ModalRouter())
    }
    
}
