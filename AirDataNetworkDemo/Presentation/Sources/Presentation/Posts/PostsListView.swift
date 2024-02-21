//
//  ContentView.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import Domain
import SwiftUI

public struct PostsListView: View {
    @EnvironmentObject var coordinator: Coordinator<Route.Posts>
    @ObservedObject private var viewModel: PostsViewModel
    
    public var body: some View {
        LoadStateView(viewModel: viewModel) {
            ScrollView {
                VStack {
                    ForEach(viewModel.posts) { post in
                        PostCellView(post: post)
                            .onTapGesture {
                                self.coordinator.go(to: .detail(post: post))
                            }
                    }
                    .padding()
                }
            }
        }
        .tint(.orange)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    self.coordinator.go(to: .add)
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    self.coordinator.go(to: .account)
                } label: {
                    Image(systemName: "person.crop.circle.fill")
                }
            }
        }
    }
    
    public init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
    }
}
