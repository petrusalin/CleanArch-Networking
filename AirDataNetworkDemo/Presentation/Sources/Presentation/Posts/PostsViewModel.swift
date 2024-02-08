//
//  PostsViewModel.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation
import Domain

public enum PostError: LocalizedError {
    case requestFailed
}

@MainActor
public final class PostsViewModel: ObservableObject, LoadableStateViewModel {
    private let repository: PostRepository
    
    var posts: [PostEntity] {
        if case let .loaded(t) = state {
            return t
        }
        
        return []
    }
    
    /// The state of the view model
    @Published public var state: LoadState<[PostEntity], PostError> = .idle
    
    public init(repository: PostRepository) {
        self.repository = repository
    }
    
    /// Function that does the loading
    public func load() {
        guard !self.state.isLoading else { return }
        
        self.state = .loading
        
        Task {
            do {
                let posts = try await self.repository.requestPosts()
                self.state = .loaded(posts)
            } catch {
                self.state = .error(.requestFailed)
            }
        }
    }
}
