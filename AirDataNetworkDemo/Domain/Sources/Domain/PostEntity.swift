//
//  Post.swift
//  postsuikit
//
//  Created by Alin Petrus on 18.01.2024.
//

import Foundation

public struct PostEntity: Equatable, Hashable, Identifiable {
    public let id: Int
    public let title: String
    public let body: String
    
    public init(id: Int, title: String, body: String) {
        self.id = id
        self.title = title
        self.body = body
    }
}
