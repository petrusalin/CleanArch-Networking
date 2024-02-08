//
//  RemotePostRepository.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation
import Domain

public class RemotePostRepository: PostRepository {
    
    private let api: PostAPI
    
    public init(api: PostAPI = PostsAPIImpl()) {
        self.api = api
    }
    
    public func requestPosts() async throws -> [PostEntity] {
        try await api.requestPosts().map { $0.postEntity }
    }
}
