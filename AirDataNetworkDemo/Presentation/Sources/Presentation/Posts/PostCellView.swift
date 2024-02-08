//
//  PostCellView.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import SwiftUI
import Domain

struct PostCellView: View {
    private let post: PostEntity
    
    var body: some View {
        VStack {
            HStack {
                Text(post.title)
                    .font(.title2)
                Spacer()
            }
            HStack {
                Text(post.body)
                    .font(.body)
                Spacer()
            }
        }
    }
    
    init(post: PostEntity) {
        self.post = post
    }
}
