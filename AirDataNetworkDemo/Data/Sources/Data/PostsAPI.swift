//
//  PostsAPI.swift
//  postsuikit
//
//  Created by Alin Petrus on 18.01.2024.
//

import Foundation
import AirDataNetwork
import Models

public protocol PostAPI {
    func requestPosts() async throws -> [Post]
}
