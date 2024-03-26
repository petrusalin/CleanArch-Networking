//
//  PostRouter.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import Foundation
import Routing
import SwiftUI

public final class PostsRouter: CompositeRouter<Route.Posts> {
    
    convenience public init() {
        self.init(stackRouter: StackRouter(), 
                  sheetRouter: SheetRouter(),
                  modalRouter: ModalRouter())
    }
    
    public override func navigate(to route: Route.Posts) {
        if route == .add {
            self.sheetRouter.navigate(to: .add)
        } else {
            self.stackRouter.navigate(to: route)
        }
    }
    
}
