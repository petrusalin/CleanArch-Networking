//
//  Posts+Entity.swift
//  postsuikit
//
//  Created by Alin Petrus on 18.01.2024.
//

import Foundation
import Domain
import Models

extension Post {
    
    var postEntity: PostEntity {
        PostEntity(id: id, title: title, body: body)
    }
}
