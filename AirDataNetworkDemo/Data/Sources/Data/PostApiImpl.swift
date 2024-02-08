//
//  PostApiImpl.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import Foundation
import AirDataNetwork
import Models

public class PostsAPIImpl: PostAPI {
    private let networkEngine: NetworkEngine
    
    public init(networkEngine: NetworkEngine = NetworkEngineImpl(basePath: "https://jsonplaceholder.typicode.com")) {
        self.networkEngine = networkEngine
    }
    
    public func requestPosts() async throws -> [Post] {
        try await networkEngine.send(Resource.posts)
    }
}
