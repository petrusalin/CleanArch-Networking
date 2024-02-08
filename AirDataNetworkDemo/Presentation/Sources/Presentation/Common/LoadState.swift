//
//  LoadState.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation

/// State machine representing the current state the view can be in.
public enum LoadState<T: Equatable, U: LocalizedError> {
    case idle
    case loading
    case loaded(T)
    case error(U)
    
    var isLoaded: Bool {
        if case .loaded = self {
            return true
        }
        
        return false
    }
    
    var isLoading: Bool {
        if case .loading = self {
            return true
        }
        
        return false
    }
}

extension LoadState: Equatable {
    
    public static func == (lhs: LoadState, rhs: LoadState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading):
            return true
        case let (.loaded(lhEntity), .loaded(rhEntity)):
            return lhEntity == rhEntity
        case let (.error(lherror), .error(rhError)):
            return lherror.errorDescription == rhError.errorDescription &&
            lherror.failureReason == rhError.failureReason
        default:
            return false
        }
    }
    
}

