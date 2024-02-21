//
//  Route.swift
//
//
//  Created by Alin Petrus on 19.02.2024.
//

import Domain
import Foundation

public enum Route {}

public extension Route {
    
    enum Tabs: Identifiable, Hashable {
        case posts
        case account
        
        public var id: Self {
            return self
        }
    }
}

public extension Route {
    
    enum Posts: Identifiable, Hashable {
        case add
        case detail(post: PostEntity)
        case dummy
        
        public var id: Self {
            return self
        }
    }
    
}

public extension Route {
    
    enum AccountSettings: Identifiable, Hashable {
        case profile
        case security
        
        public var id: Self {
            return self
        }
    }
}
