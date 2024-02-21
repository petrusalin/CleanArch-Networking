//
//  PostsViewFactory.swift
//  
//
//  Created by Alin Petrus on 19.02.2024.
//

import SwiftUI

public struct PostsViewFactory: ViewFactory {
    
    public init() {}
    
    @ViewBuilder
    public func view(forRoute route: Route.Posts) -> some View {
        switch route {
        case .detail(let post):
            PostDetailsView(viewModel: PostDetailsViewModel(postEntity: post))
        case .dummy:
            DummyView()
        case .add:
            NavigationStack {
                AddPostView()
            }
        case .account:
            AccountViewFactory().view(forRoute: .main)
                .register(routingPair: RoutingPairProvider.accountsPair())
        }
    }
    
}
