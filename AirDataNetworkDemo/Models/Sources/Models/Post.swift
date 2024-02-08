//
//  Post.swift
//  postsuikit
//
//  Created by Alin Petrus on 18.01.2024.
//

import Foundation

public struct Post: Codable, Identifiable, Equatable, Hashable {
    public let id: Int
    public let userId: Int
    public let title: String
    public let body: String
}
