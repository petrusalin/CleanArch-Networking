//
//  RoutingPairProvider.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import Foundation
import Routing
import SwiftUI

public enum RoutingPairProvider {
    
    public static func postsPair() -> RoutingPair<Route.Posts, PostsRouter, PostsViewFactory> {
        RoutingPair(router: PostsRouter(), factory: PostsViewFactory())
    }
    
    public static func accountsPair() -> RoutingPair<Route.AccountSettings, AccountRouter, AccountViewFactory> {
        RoutingPair(router: AccountRouter(), factory: AccountViewFactory())
    }
    
}
