//
//  PostRepository.swift
//  postsuikit
//
//  Created by Alin Petrus on 18.01.2024.
//

import Foundation

public protocol PostRepository {
    func requestPosts() async throws -> [PostEntity]
}
