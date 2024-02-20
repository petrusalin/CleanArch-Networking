//
//  PostDetailsView.swift
//
//
//  Created by Alin Petrus on 19.02.2024.
//

import Domain
import SwiftUI

public struct PostDetailsView: View {
    @ObservedObject var postViewModel: PostDetailsViewModel
    @EnvironmentObject var router: Router<Route.Posts>
    
    public var body: some View {
        VStack {
            Spacer()
            Image(systemName: "scribble.variable")
                .resizable()
                .renderingMode(.template)
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundStyle(.orange)
            HStack {
                Spacer()
                Text(postViewModel.title)
                    .font(.title)
                Spacer()
            }
            Spacer()
                .frame(height: 50)
            Text(postViewModel.body)
                .multilineTextAlignment(.center)
                .font(.body)
            Spacer()
                .frame(height: 50)
            Button("Pop") {
                self.router.pop()
            }
            .tint(.orange)
            Button("Dummy") {
                self.router.push(route: .dummy)
            }
            .tint(.orange)
            Spacer()
        }
        .navigationWithTitle("Details")
    }
    
    public init(viewModel: PostDetailsViewModel) {
        self.postViewModel = viewModel
    }
}
