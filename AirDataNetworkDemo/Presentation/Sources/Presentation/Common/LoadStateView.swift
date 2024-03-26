//
//  LoadStateView.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import SwiftUI

@MainActor
struct LoadStateView<ViewModel: LoadableStateViewModel, Content: View>: View {
    
    // MARK: - Properties
    
    @ObservedObject private var viewModel: ViewModel
    private let content: () -> Content
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            self.idleView()
        case .loading:
            LoadingView()
                .frame(maxHeight: .infinity)
        case .loaded:
            self.content()
        case .error(let error):
            self.errorView(error: error)
        }
    }
    
    // MARK: - Initializer
    
    init(viewModel: ViewModel,
         @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = content
    }
    
    // MARK: - Private
    
    private func idleView() -> some View {
        self.content()
            .task {
                self.viewModel.load()
            }
    }
    
    private func errorView(error: LocalizedError) -> some View {
        VStack {
            Spacer()
            Text(error.localizedDescription)
            Spacer()
        }
    }
    
}

