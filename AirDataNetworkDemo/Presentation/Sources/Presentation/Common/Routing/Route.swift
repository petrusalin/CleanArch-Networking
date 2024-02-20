//
//  Route.swift
//
//
//  Created by Alin Petrus on 19.02.2024.
//

import Domain
import Foundation

public enum Route: Identifiable, Hashable {
    case Posts(Post)
    case Account(AccountSettings)
    
    public var id: Self {
        return self
    }
}

public extension Route {
    
    enum Post: Identifiable, Hashable {
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
