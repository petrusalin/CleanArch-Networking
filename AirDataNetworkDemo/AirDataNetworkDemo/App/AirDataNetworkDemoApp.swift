//
//  AirDataNetworkDemoApp.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import SwiftUI
import Data
import Presentation

@main
struct AirDataNetworkDemoApp: App {
    
    var body: some Scene {
        WindowGroup {
            // Glue things up, decide where the data comes from, pass it to the presentation
//            PostsListView(viewModel: PostsViewModel(repository: StaticPostRepository()))
                PostsListView(viewModel: PostsViewModel(repository: RemotePostRepository()))
                    .navigationWithTitle("Posts")
                    .register(router: PostsRouter(), factory: PostsViewFactory())
                    .tint(.white)
        }
    }
}
