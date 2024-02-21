//
//  Route.swift
//
//
//  Created by Alin Petrus on 19.02.2024.
//

import Domain
import Foundation

public typealias Routable = Identifiable & Hashable

public enum Route {}

public extension Route {
    
    enum Flow: Routable {
        case posts
        case account
        
        public var id: Self {
            return self
        }
    }
}

public extension Route {
    
    enum Posts: Routable {
        case add
        case detail(post: PostEntity)
        case dummy
        
        public var id: Self {
            return self
        }
    }
    
}

public extension Route {
    
    enum AccountSettings: Routable {
        case profile
        case security
        
        public var id: Self {
            return self
        }
    }
}
