//
//  PostRouter.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import Foundation
import SwiftUI

public final class PostsRouter: ConcreteRouter<Route.Posts> {
    
    public convenience init() {
        self.init(navigationPath: NavigationPath())
    }
    
    public override func go(to route: Route.Posts) {
        if route == .add {
            self.sheetRoute = route
        } else {
            self.push(route: route)
        }
    }
    
    public override func goBack() {
        if self.sheetRoute != nil {
            self.dismiss()
        } else {
            self.pop()
        }
    }
}
