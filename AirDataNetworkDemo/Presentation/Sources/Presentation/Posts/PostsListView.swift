//
//  ContentView.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import Domain
import SwiftUI

public struct PostsListView: View {
    @Environment(\.coordinator) var coordinator
    @ObservedObject private var viewModel: PostsViewModel
    
    public var body: some View {
        LoadStateView(viewModel: viewModel) {
            ScrollView {
                VStack {
                    ForEach(viewModel.posts) { post in
                        PostCellView(post: post)
                            .onTapGesture {
                                self.coordinator?.push(route: .Posts(.detail(post: post)))
                            }
                    }
                    .padding()
                }
            }
        }
        .tint(.orange)
    }
    
    public init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
    }
}
