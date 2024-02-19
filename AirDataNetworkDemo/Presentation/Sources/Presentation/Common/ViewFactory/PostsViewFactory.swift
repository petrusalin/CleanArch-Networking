//
//  PostsViewFactory.swift
//  
//
//  Created by Alin Petrus on 19.02.2024.
//

import SwiftUI

struct PostsViewFactory: ViewFactory {
    
    @ViewBuilder
    func view(forRoute route: Route.Post) -> some View {
        switch route {
        case .detail(let post):
            PostDetailsView(viewModel: PostDetailsViewModel(postEntity: post))
        case .dummy:
            DummyView()
        }
    }
    
}
