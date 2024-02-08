//
//  StaticPostRepository.swift
//
//
//  Created by Alin Petrus on 08.02.2024.
//

import Foundation
import Domain

public class StaticPostRepository: PostRepository {
    
    public init() {}
    
    public func requestPosts() async throws -> [Domain.PostEntity] {
        [PostEntity(id: 1, title: "Title 1", body: "Body 1"),
        PostEntity(id: 2, title: "Title 2", body: "Body 2"),
        PostEntity(id: 3, title: "Title 3", body: "Body 3")]
    }
    
}
