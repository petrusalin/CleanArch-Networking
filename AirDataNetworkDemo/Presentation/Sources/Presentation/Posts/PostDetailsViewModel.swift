//
//  PostDetailsViewModel.swift
//
//
//  Created by Alin Petrus on 19.02.2024.
//

import Domain
import Foundation

public final class PostDetailsViewModel: ObservableObject {
    @Published private(set) var postEntity: PostEntity
    
    var title: String {
        postEntity.title
    }
    
    var body: String {
        postEntity.body
    }
    
    public init(postEntity: PostEntity) {
        self.postEntity = postEntity
    }
    
}
