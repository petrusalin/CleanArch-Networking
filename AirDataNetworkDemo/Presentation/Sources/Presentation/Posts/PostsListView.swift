//
//  ContentView.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import SwiftUI

public struct PostsListView: View {
    @ObservedObject private var viewModel: PostsViewModel
    
    public var body: some View {
        LoadStateView(viewModel: viewModel) {
            ScrollView {
                VStack {
                    if viewModel.state.isLoaded {
                        ForEach(viewModel.posts) { post in
                            PostCellView(post: post)
                        }
                        .padding()
                    } else {
                        LoadingView()
                    }
                }
            }
        }
    }

    public init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
    }
}
