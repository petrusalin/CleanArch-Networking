//
//  PagedLoadStateView.swift
//
//
//  Created by Alin Petrus on 18.03.2024.
//

import SwiftUI

@MainActor
struct PagedLoadStateView<ViewModel: PagedLoadableStateViewModel, Content: View>: View {
    
    // MARK: - Properties
    
    @ObservedObject private var viewModel: ViewModel
    private let content: () -> Content
    
    var body: some View {
        LoadStateView(viewModel: self.viewModel) {
            ScrollView {
                if self.viewModel.state.isLoaded {
                    self.loadedView
                } else {
                    self.nonLoadedView
                }
            }
        }
    }
    
    private var nonLoadedView: some View {
        LazyVStack {
            self.content()
        }
    }
    
    private var loadedView: some View {
        LazyVStack {
            self.content()
            Color.clear
                .onAppear {
                    if !self.viewModel.isLoadingMore && self.viewModel.canLoadMore {
                        self.viewModel.loadNextPage()
                    }
                }
                .if(self.viewModel.isLoadingMore) { view in
                    VStack {
                        view
                        ProgressView()
                    }
                }
        }
    }
    
    // MARK: - Initializer(s)
    
    init(viewModel: ViewModel,
         @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = content
    }
    
}
