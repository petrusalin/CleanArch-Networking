//
//  RoutingPairProvider.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import Foundation
import SwiftUI

public enum RoutingPairProvider {
    
    public static func postsPair() -> RoutingPair<Route.Posts, PostsViewFactory> {
        RoutingPair(router: PostsRouter(), factory: PostsViewFactory())
    }
    
    public static func accountsPair() -> RoutingPair<Route.AccountSettings, AccountViewFactory> {
        RoutingPair(router: AccountRouter(), factory: AccountViewFactory())
    }
    
}
