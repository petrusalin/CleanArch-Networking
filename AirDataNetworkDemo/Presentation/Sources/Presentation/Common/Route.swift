//
//  Route.swift
//
//
//  Created by Alin Petrus on 19.02.2024.
//

import Domain
import Foundation

public enum Route: Hashable {
    case Posts(Post)
}

public extension Route {
    enum Post: Hashable {
        case detail(post: PostEntity)
        case dummy
    }
}
