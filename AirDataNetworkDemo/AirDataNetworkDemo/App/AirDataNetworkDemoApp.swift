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
            TabView {
                Group {
                    PostsListView(viewModel: PostsViewModel(repository: RemotePostRepository()))
                        .navigationWithTitle("Posts")
                        .register(routingPair: RoutingPairProvider.postsPair())
                        .tint(.white)
                        .tabItem {
                            Label("Posts", systemImage: "list.bullet.clipboard.fill")
                        }
                    AccountViewFactory().view(forRoute: .main)
                        .navigationTitle("Account")
                        .register(routingPair: RoutingPairProvider.accountsPair())
                        .tint(.white)
                        .tabItem {
                            Label("Account", systemImage: "person.crop.circle")
                        }
                }
                .toolbarBackground(.orange, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            }
            .tint(.white)
        }
    }
}
