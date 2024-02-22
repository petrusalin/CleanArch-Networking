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
        self.init(stackRouter: StackRouter(), modalRouter: ModalRouter())
    }
    
    public override func go(to route: Route.Posts) {
        if route == .add {
            self.modalRouter.go(to: .add)
        } else {
            self.stackRouter.go(to: route)
        }
    }
    
}
